#!/usr/bin/env python3
#!/usr/bin/env python3
import subprocess
import evdev
import sys

# --- CONFIGURATION ---
KEYBOARD_NAME_SUBSTR = 'Keychron K10 Pro Keyboard'   # Replace this with a unique substring of your keyboard's reported name
KEY_TO_LISTEN = 'KEY_SYSRQ'                   # The key you want to trigger

def find_keyboard_device(name_substr):
    """Find the InputDevice whose name contains name_substr (case-insensitive)."""
    devices = [evdev.InputDevice(path) for path in evdev.list_devices()]
    for device in devices:
        if name_substr.lower() in device.name.lower():
            return device
    raise RuntimeError(f"No input device found matching '{name_substr}'")

try:
    keyboard = find_keyboard_device(KEYBOARD_NAME_SUBSTR)
except RuntimeError as err:
    print(err)
    sys.exit(1)

print(f"Listening for {KEY_TO_LISTEN} on {keyboard.name} ({keyboard.path})...")

for event in keyboard.read_loop():
    if event.type == evdev.ecodes.EV_KEY:
        keyevent = evdev.categorize(event)
        if keyevent.keycode == KEY_TO_LISTEN and keyevent.keystate == keyevent.key_down:
            try:
                subprocess.run('grim -g "$(slurp)" /tmp/screenshot.png && wl-copy < /tmp/screenshot.png', 
                               shell=True, check=True)
                subprocess.run(['notify-send', 'Screenshot copied to clipboard!'], check=True)
            except Exception as e:
                print("Error capturing screenshot:", e)


#
#import subprocess
#from evdev import InputDevice, categorize, ecodes

# --- CONFIGURATION ---
#KEYBOARD_DEVICE = '/dev/input/event18'  # your Bluetooth keyboard
#KEY_TO_LISTEN = 'KEY_SYSRQ'            # the key you want to trigger

# Initialize keyboard device
#keyboard = InputDevice(KEYBOARD_DEVICE)
#print(f"Listening for {KEY_TO_LISTEN} on {keyboard.name} ({keyboard.path})...")

# Main loop
#for event in keyboard.read_loop():
#    if event.type == ecodes.EV_KEY:
#        keyevent = categorize(event)
#        if keyevent.keycode == KEY_TO_LISTEN and keyevent.keystate == keyevent.key_down:
#            try:
#                # Execute your exact one-liner
#                subprocess.run('grim -g "$(slurp)" /tmp/screenshot.png && wl-copy < /tmp/screenshot.png', 
#                               shell=True, check=True)
#                subprocess.run(['notify-send', 'Screenshot copied to clipboard!'], check=True)
#            except Exception as e:
#                print("Error capturing screenshot:", e)

