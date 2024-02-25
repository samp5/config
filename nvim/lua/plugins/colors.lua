local nnoremap = require 'maps'.nnoremap
return {
  'nvim-lua/plenary.nvim',
  'nvim-lua/popup.nvim',
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require('kanagawa').setup({
        commentStyle = { italic = false },
        keywordStyle = { italic = false },
        statementStyle = { bold = true },
        dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
        transparent = true,
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {
          -- add/modify theme and palette colors
          palette = {
            -- change background color
            sumiInk6 = "#54546D",
            -- change line number, etc color
            --						sumiInk4 = "#121212",
          },
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = theme.ui.bg_p1 },
            TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
            TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
            TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
          }
        end,
        theme = "wave", -- Load "wave" theme when 'background' option is not set
        background = {
          -- map the value of 'background' option to a theme
          dark = "wave", -- try "dragon" !
          light = "lotus"
        },
      })
    end
  },
}
