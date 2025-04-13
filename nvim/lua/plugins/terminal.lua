return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    init = function() end,
    config = function()
      require('toggleterm').setup({
        start_in_insert = true,
        -- direction = 'tab',
        open_mapping = [[<c-t>]],
        size = 25
      })
    end,
  }
}

