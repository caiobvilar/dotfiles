return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      italic_comments = true,
      hide_fillchars = true,
      terminal_colors = true,
      borderless_pickers = true,
      integrations = {
        telescope = true,
        mini = true,
        indentblankline = true,
       lazy = true,
      },
    },
    config = function(_, opts)
      require("cyberdream").setup(opts)
      vim.cmd.colorscheme("cyberdream")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "cyberdream",
    },
  },
}
