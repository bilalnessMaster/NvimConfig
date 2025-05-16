require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>gg", function()
  require("nvchad.term").new { cmd = "lazygit", pos = "float", id = "lazygit" }
end, { desc = "Open LazyGit" })
