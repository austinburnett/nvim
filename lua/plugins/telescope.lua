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

            local live_grep_in_dir = function()
                vim.ui.input({ prompt = 'Search Directory: ', default = '~/', completion = 'dir' }, function(input)
                    if input == nil or input == '' then
                        return
                    end

                    telescopeBuiltIn.live_grep({
                        search_dirs = { input },
                        prompt_title = 'Live Grep in ' .. input,
                    })
                end)
            end

            -- Notepad++ Like Search Functionality
            local find_files_in_dir = function()
                vim.ui.input({ prompt = 'Search Directory: ', default = '~/', completion = 'dir' }, function(input)
                    if input == nil or input == '' then
                        return
                    end

                    telescopeBuiltIn.find_files({
                        search_dirs = { input },
                        prompt_title = 'Find Files In ' .. input,
                    })
                end)
            end

            vim.keymap.set('n', '<leader>ft', live_grep_in_dir, { desc = 'Search for text in specific directory' })
            vim.keymap.set('n', '<leader>sd', find_files_in_dir, { desc = 'Search for files in specific directory' })
        end
    }
}
