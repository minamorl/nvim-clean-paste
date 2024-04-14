local M = {}

function M.setup()
    -- Set up the autocmd for TextYankPost event
    vim.api.nvim_create_autocmd("TextYankPost", {
        callback = function()
            vim.schedule(function()
                -- Get the contents of the unnamed register
                local content = vim.fn.getreg('"')

                -- Remove ^M characters from the content
                content = content:gsub('\r', '')

                -- Set the modified content back to the unnamed register
                vim.fn.setreg('"', content)

                -- Perform the default paste operation
                vim.cmd('normal! p')
            end)
        end,
    })
end

return M
