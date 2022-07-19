
local status_ok, tree = pcall(require, 'nvim-tree')
if not status_ok then
    return
end

tree.setup({
    auto_reload_on_write = true,
    create_in_closed_folder = false,
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = true,
    ignore_ft_on_setup = {
        'startify',
        'dashboard',
        'alpha',
    },
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,
    diagnostics = {
        enable = true,
        icons = {
            hint = '',
            info = '',
            warning = '',
            error = '',
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = 'left',
        -- auto_resize = true,
        mappings = {
            custom_only = false,
            list = {
              --  { key = { 'l', '<CR>', 'o' }, cb = tree_cb('edit') },
              --  { key = 'h', cb = tree_cb('close_node') },
              --  { key = 'v', cb = tree_cb('vsplit') },
            },
        },
        number = true,
        relativenumber = true,
    },
    renderer = {
        icons = {
            glyphs = {
                default = '',
                symlink = '',
                folder = {
                    default = '',
                    open = '',
                    empty = '',
                    empty_open = '',
                    symlink = '',
                },
                git = {
                    unstaged = '',
                    staged = 'S',
                    unmerged = '',
                    renamed = '➜',
                    deleted = '',
                    untracked = 'U',
                    ignored = '◌',
                },
            },
        },
    },
})
