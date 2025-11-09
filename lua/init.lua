require("set")
require("remap")
require("config.lazy")

--vim.diagnostic.config({ virtual_lines = true})
vim.diagnostic.config({ virtual_text = true})

vim.filetype.add({
    extension = {vs = "glsl", fs = "glsl"}
})
