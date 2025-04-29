return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require('lualine').setup({
      options = {
        theme = 'auto',
        icons_enabled = true,
        section_separators = '',
        component_separators = '',
        always_divide_middle = true,
        globalstatus = true, -- Single unified statusline
      },
      sections = {
        lualine_a = {}, -- No mode
        lualine_b = { 'branch', 'diff' },
        lualine_c = {
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            sections = { 'error', 'warn', 'info', 'hint' },
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            update_in_insert = false,
            always_visible = true,
          },
          {
            'buffers',
            show_filename_only = true,
            hide_filename_extension = false,
            show_modified_status = true,
            symbols = { modified = ' ●', alternate_file = '#', directory =  '' },
            buffers_color = {
              active = "lualine_c_normal",   -- color of active buffer
              inactive = "lualine_c_inactive", -- color of inactive buffers
            },
          },
        },
        lualine_x = {
          {
            function()
              local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
              if #buf_clients == 0 then
                return ''
              end
              local names = {}
              for _, client in ipairs(buf_clients) do
                table.insert(names, client.name)
              end
              return ' ' .. table.concat(names, ' + ')
            end,
            color = { fg = '#98be65' },
          },
          'filetype',
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    })
  end,
}
