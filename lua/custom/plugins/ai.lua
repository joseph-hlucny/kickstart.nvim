--[[
  AI-Related Plugins Configuration
  
  This file contains all AI-powered plugins and tools for enhanced coding assistance.
  You can add additional AI plugins here as you discover new tools.
--]]

return {
  -- ===================================================================
  --                      OPENCODE.NVIM
  -- ===================================================================
  -- Seamlessly integrate the opencode AI assistant with Neovim
  -- Provides convenient and editor-aware research, reviews, and requests
  -- Repo: https://github.com/NickvanDyke/opencode.nvim
  {
    'NickvanDyke/opencode.nvim',
    dependencies = {
      -- Snacks.nvim provides better prompt input and is required for embedded terminal
      -- You can disable the input feature if you prefer default Neovim input
      { 'folke/snacks.nvim', opts = { input = { enabled = true } } },
    },
    config = function()
      -- ===================================================================
      --                      PLUGIN CONFIGURATION
      -- ===================================================================
      -- Configure opencode.nvim via global variable for faster startup
      -- For all available options, see: lua/opencode/config.lua in the plugin repo
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Add your custom configuration here
        -- Example options you might want to configure:
        -- auto_reload = true,           -- Auto-reload buffers when opencode modifies them
        -- connection_timeout = 5000,    -- Connection timeout in milliseconds
        -- model = "claude-3-5-sonnet",  -- Default AI model to use
        --
        -- For more configuration options, check the plugin documentation
      }

      -- ===================================================================
      --                      REQUIRED SETTINGS
      -- ===================================================================
      -- Enable autoread for real-time buffer updates when opencode modifies files
      vim.opt.autoread = true

      -- ===================================================================
      --                      KEYMAPS
      -- ===================================================================
      -- Core functionality keymaps
      vim.keymap.set('n', '<leader>ot', function()
        require('opencode').toggle()
      end, { desc = 'Toggle opencode terminal' })

      vim.keymap.set('n', '<leader>oA', function()
        require('opencode').ask()
      end, { desc = 'Ask opencode (free prompt)' })

      -- Context-aware prompts - these use @ placeholders for automatic context injection
      vim.keymap.set('n', '<leader>oa', function()
        require('opencode').ask '@cursor: '
      end, { desc = 'Ask opencode about cursor context' })

      vim.keymap.set('v', '<leader>oa', function()
        require('opencode').ask '@selection: '
      end, { desc = 'Ask opencode about selected text' })

      -- Session management
      vim.keymap.set('n', '<leader>on', function()
        require('opencode').command 'session_new'
      end, { desc = 'Start new opencode session' })

      -- Response management
      vim.keymap.set('n', '<leader>oy', function()
        require('opencode').command 'messages_copy'
      end, { desc = 'Copy last opencode response' })

      -- Navigation within opencode messages
      vim.keymap.set('n', '<S-C-u>', function()
        require('opencode').command 'messages_half_page_up'
      end, { desc = 'Scroll opencode messages up' })

      vim.keymap.set('n', '<S-C-d>', function()
        require('opencode').command 'messages_half_page_down'
      end, { desc = 'Scroll opencode messages down' })

      -- Prompt library access
      vim.keymap.set({ 'n', 'v' }, '<leader>os', function()
        require('opencode').select()
      end, { desc = 'Select from opencode prompt library' })

      -- ===================================================================
      --                      CUSTOM PROMPTS
      -- ===================================================================
      -- Example custom prompts - add your own frequently used prompts here
      vim.keymap.set('n', '<leader>oe', function()
        require('opencode').prompt 'Explain @cursor and its context'
      end, { desc = 'Explain code at cursor' })

      -- Uncomment and customize these examples as needed:
      --
      -- vim.keymap.set('n', '<leader>or', function()
      --   require('opencode').prompt('Review @selection for potential improvements')
      -- end, { desc = 'Code review selection' })
      --
      -- vim.keymap.set('n', '<leader>of', function()
      --   require('opencode').prompt('Fix any issues in @buffer')
      -- end, { desc = 'Fix issues in current buffer' })
      --
      -- vim.keymap.set('n', '<leader>od', function()
      --   require('opencode').prompt('Add documentation for @cursor')
      -- end, { desc = 'Add documentation' })

      -- ===================================================================
      --                      CONTEXT PLACEHOLDERS
      -- ===================================================================
      --[[
        Available context placeholders for prompts:
        @buffer      - Current buffer content
        @buffers     - All open buffers
        @cursor      - Code at cursor position  
        @selection   - Selected text (visual mode)
        @visible     - Currently visible text
        @diagnostic  - Current line diagnostics
        @diagnostics - All buffer diagnostics
        @quickfix    - Quickfix list
        @diff        - Git diff
        @grapple     - Grapple tags (if using grapple.nvim)
        
        You can combine multiple placeholders in a single prompt:
        Example: "Explain @cursor and fix @diagnostic"
      --]]
    end,
  },

  -- ===================================================================
  --                      FUTURE AI PLUGINS
  -- ===================================================================
  -- Add other AI-powered plugins here as you discover them:
  --
  -- GitHub Copilot:
  -- {
  --   'github/copilot.vim',
  --   config = function()
  --     -- Your copilot configuration
  --   end,
  -- },
  --
  -- Codeium:
  -- {
  --   'Exafunction/codeium.vim',
  --   config = function()
  --     -- Your codeium configuration
  --   end,
  -- },
}

