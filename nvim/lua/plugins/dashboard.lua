return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      -- config
      theme = 'hyper',
      config = {
        week_header = {
          enable = true,
        },
        project = { enable = false, limit = 4, label = '', action = 'Telescope find_files cwd=' },
        mru = { enable = true, limit = 6, cwd_only = true },
        shortcut = {
          { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            icon = '󰱼 ',
            icon_hl = '@variable',
            desc = 'Word',
            group = 'Label',
            action = 'Telescope grep_string',
            key = 'w',
          },
          {
            icon = '',
            icon_hl = '@variable',
            desc = 'Quit',
            group = 'Label',
            action = ':q',
            key = 'q',
          },
        },
      },
    }
  end,
  requires = { 'nvim-tree/nvim-web-devicons' }
}
