require("gruvbox").setup({
    palette_overrides = {
        bright_green = "#ebdbb2",
    }
})
vim.cmd("colorscheme gruvbox")


require("neo-tree").setup({
    window = {
          position = "left",
          width = 25,
          mapping_options = {
            noremap = true,
            nowait = true,
          },
    },
})


