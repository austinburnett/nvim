return {
    "rebelot/kanagawa.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        -- load the colorscheme here

        require('kanagawa').setup({
            overrides = function(colors)
                return {
                    -- Assign a static color to strings
                    Constant = { fg = colors.palette.fujiWhite }
                }
            end
        })
        vim.cmd([[colorscheme kanagawa]])
    end,
}
