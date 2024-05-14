-- Harpoon 2 is buggy on Windows | Uncomment this to use Harpoon 2
-- local harpoon = require("harpoon")
--
-- -- REQUIRED
-- harpoon:setup()
-- -- REQUIRED
--
-- vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end)
-- vim.keymap.set("n", "<C-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
--
-- vim.keymap.set("n", "<C-hq>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<C-hw>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<C-he>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<C-hr>", function() harpoon:list():select(4) end)
--
-- -- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<C-H-P>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<C-H-N>", function() harpoon:list():next() end)

-- Harpoon 1 config fall back | Delete this if you use Harpoon 2
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file)
vim.keymap.set("n", "<C-h>", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>hq", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>hw", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>he", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>hr", function() ui.nav_file(4) end)
