return
{
    {
        -- Using tag='*' pins the installation to the latest telescope release.
        'nvim-telescope/telescope.nvim', tag = '*',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function ()
            local telescopeBuiltIn = require('telescope.builtin')

            vim.keymap.set('n', '<leader>ff', telescopeBuiltIn.find_files, {})
            vim.keymap.set('n', '<leader>fg', telescopeBuiltIn.live_grep, {})
            vim.keymap.set('n', '<leader>fb', telescopeBuiltIn.buffers, {})
            vim.keymap.set('n', '<leader>fh', telescopeBuiltIn.help_tags, {})
        end
    }
}
