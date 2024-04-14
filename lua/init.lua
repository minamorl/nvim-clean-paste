local M = {}

function M.setup()
    -- Define a custom paste function
    local function custom_paste()
        -- Get the contents of the unnamed register
        local content = vim.fn.getreg('"')

        -- Remove \r characters from the content
        content = string.gsub(content, "\r", "")

        -- Set the modified content back to the unnamed register
        vim.fn.setreg('"', content)

        -- Perform the default paste operation
        vim.cmd('normal! p')
    end

    -- Create a key mapping for the custom paste function
    vim.api.nvim_set_keymap('n', 'p', '<cmd>lua require("nvim-paste-clean").custom_paste()<CR>', { noremap = true, silent = true })

    -- Set up the autocmd for TextYankPost event
    vim.api.nvim_create_autocmd("TextYankPost", {
        callback = function()
            vim.schedule(function()
                local bufnr = vim.api.nvim_get_current_buf()
                local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
                local new_lines = {}
                for _, line in ipairs(lines) do
                    line = string.gsub(line, "\r", "")
                    table.insert(new_lines, line)
                end
                vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, new_lines)
            end)
        end,
    })
end

function M.custom_paste()
    -- Get the contents of the unnamed register
    local content = vim.fn.getreg('"')

    -- Remove \r characters from the content
    content = string.gsub(content, "\r", "")

    -- Set the modified content back to the unnamed register
    vim.fn.setreg('"', content)

    -- Perform the default paste operation
    vim.cmd('normal! p')
end

return M
