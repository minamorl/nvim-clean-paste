local M = {}

function M.custom_paste()
    local clipboard_reg = '*'
    if vim.fn.has('unnamedplus') == 1 then
        clipboard_reg = '+'
    end
    local yanked_text = vim.fn.getreg(clipboard_reg)
    local cleaned_text = string.gsub(yanked_text, "\r", "")
    vim.fn.setreg(clipboard_reg, cleaned_text)
    vim.cmd('normal! "' .. clipboard_reg .. 'p')
end

return M
