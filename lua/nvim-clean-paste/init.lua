local M = {}

function M.custom_paste()
    local yanked_text = vim.fn.getreg('"')
    local cleaned_text = string.gsub(yanked_text, "\r", "")
    vim.fn.setreg('"', cleaned_text)
    vim.cmd('normal! ""p')
end

return M
