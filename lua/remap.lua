-- Leader key is spacebar
vim.g.mapleader = " "

-- Go from terminal mode to Normal mode
vim.keymap.set("t", "<C-[>", "<C-\\><C-N>")

-- Copy to clipboard
vim.keymap.set("v", "<leader>y", "\"*y")

-- Paste from clipboard
vim.keymap.set("n", "<leader>p", "\"*p")

-- Paste from Neovim clipboard when highlighting and retain pasted text in register
vim.keymap.set("v", "<leader>p", "\"_dP")

-- Keep cursor centered in window when searching
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Navigating window splits
vim.keymap.set("n", "<C-h>", ":wincmd h<cr>", { silent = true })
vim.keymap.set("n", "<C-j>", ":wincmd j<cr>", { silent = true })
vim.keymap.set("n", "<C-k>", ":wincmd k<cr>", { silent = true })
vim.keymap.set("n", "<C-l>", ":wincmd l<cr>", { silent = true })

-- Resizing window splits
-- MacOS doesn't play well with the alt remaps: <M-symbol>
-- Check to see what symbol MacOS sends by putting nvim in
-- insert mode and typing in Ctrl-V <Alt-,>

-- Windows
vim.keymap.set("n", "<M-,>", "<C-W>5<")
vim.keymap.set("n", "<M-.>", "<C-W>5>")
vim.keymap.set("n", "<M-s>", "<C-W>-")
vim.keymap.set("n", "<M-b>", "<C-W>+")

-- MacOS
vim.keymap.set("n", "≤", "<C-W>5<")
vim.keymap.set("n", "≥", "<C-W>5>")
vim.keymap.set("n", "ß", "<C-W>-")
vim.keymap.set("n", "∫", "<C-W>+")

-- Lsp Remaps
vim.keymap.set("n", "gd", vim.lsp.buf.declaration)

-- Debuging
vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped',{ text ='', texthl ='', linehl='Search', numhl =''})
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F9>', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
