import os
import time
import urllib.parse

import requests
from bs4 import BeautifulSoup

# Drones Volume 9, Issue 10
ISSUE_URL = "https://www.mdpi.com/2504-446X/9/10"
OUTPUT_DIR = "drones_9_10_pdfs"
DELAY_SECONDS = 5  # be extra polite

os.makedirs(OUTPUT_DIR, exist_ok=True)

session = requests.Session()
session.headers.update({
    # Browser-like headers; still may be blocked, and we respect that.
    "User-Agent": (
        "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 "
        "(KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36"
    ),
    "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
    "Accept-Language": "en-US,en;q=0.5",
    "Referer": "https://www.mdpi.com/",
    "Connection": "keep-alive",
})


def fetch_issue_html(issue_url: str) -> str:
    """Fetch issue HTML once, with clear error handling."""
    resp = session.get(issue_url, timeout=30)
    print(f"GET {issue_url} -> {resp.status_code}")

    # If MDPI returns 403, do not attempt to bypass; just stop.
    if resp.status_code == 403:
        raise SystemExit(
            "Received 403 Forbidden from MDPI. "
            "Stopping to respect server policy. "
            "Try manual download instead."
        )

    resp.raise_for_status()
    return resp.text


def get_pdf_links(issue_url: str) -> list[str]:
    """Extract PDF-like links from the issue HTML."""
    html = fetch_issue_html(issue_url)
    soup = BeautifulSoup(html, "html.parser")

    pdf_urls = set()

    for a in soup.find_all("a", href=True):
        href = a["href"]
        lower = href.lower()

        # MDPI article PDFs usually end with .pdf or include '/pdf'
        if lower.endswith(".pdf") or "/pdf" in lower:
            full_url = urllib.parse.urljoin(issue_url, href)
            pdf_urls.add(full_url)

    pdf_list = sorted(pdf_urls)
    print(f"Found {len(pdf_list)} PDF-like links.")
    return pdf_list


def download_file(url: str, out_dir: str) -> None:
    """Download one file to the output directory."""
    filename = url.split("/")[-1] or "file.pdf"
    if not filename.lower().endswith(".pdf"):
        filename += ".pdf"

    out_path = os.path.join(out_dir, filename)

    if os.path.exists(out_path):
        print(f"Skipping existing file: {filename}")
        return

    print(f"Downloading: {url}")
    with session.get(url, stream=True, timeout=60) as r:
        if r.status_code == 403:
            print(f"403 Forbidden when downloading {url}; skipping (respecting block).")
            return
        r.raise_for_status()

        with open(out_path, "wb") as f:
            for chunk in r.iter_content(chunk_size=8192):
                if chunk:
                    f.write(chunk)

    print(f"Saved to: {out_path}")


def main():
    pdf_links = get_pdf_links(ISSUE_URL)

    if not pdf_links:
        print("No PDF links detected; nothing to download.")
        return

    for url in pdf_links:
        try:
            download_file(url, OUTPUT_DIR)
            time.sleep(DELAY_SECONDS)
        except requests.exceptions.HTTPError as e:
            print(f"HTTP error for {url}: {e}")
        except Exception as e:
            print(f"Error for {url}: {e}")


if __name__ == "__main__":
    main()

