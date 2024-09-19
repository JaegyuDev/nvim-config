local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

vim.keymap.set('n', '<C-p>', function()
    local status, result = pcall(builtin.git_files)
    if not status then
        print("[Warning] Error occurred while invoking git_files:", result)
        return {}
    end
    return result
end, {})

vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
