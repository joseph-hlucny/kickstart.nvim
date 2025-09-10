--[[
  Git-Related Plugins Configuration
  
  This file contains all git-related plugins for enhanced version control.
--]]

return {
  -- ===================================================================
  --                      DIFFVIEW.NVIM
  -- ===================================================================
  -- Enhanced git diff viewing with file panel and merge conflict resolution
  {
    'sindrets/diffview.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('diffview').setup({
        -- Your configuration here
      })
    end,
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles' },
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Open Diffview' },
      { '<leader>gh', '<cmd>DiffviewFileHistory<cr>', desc = 'File History' },
    },
  },
}