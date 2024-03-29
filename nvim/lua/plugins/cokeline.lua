return {
  'willothy/nvim-cokeline',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local maps = require('maps')
    local nnoremap = maps.nnoremap
    require('cokeline').setup({
      sidebar = {
        filetype = 'NvimTree',
        components = {
          {
            text = '  NvimTree',
            style = 'bold',
          },
        }
      },
      components = {
        {
          text = function(buffer) return ' ' .. buffer.index .. ' ' end,
          bold = true,
        },
        {
          text = function(buffer)
            if buffer.pick_letter ~= string.sub(buffer.filename, 0, 1) then
              return ' (' .. buffer.pick_letter .. ') '
            else
              return ''
            end
          end,
          italic = true,
        },
        {
          text = function(buffer) return ' ' .. buffer.devicon.icon end,
          fg = function(buffer) return buffer.devicon.color end,
        },
        {
          text = function(buffer) return buffer.filename .. ' ' end,
        },
        {
          text = function(buffer) if buffer.diagnostics.errors > 0 then return '   ' else return '' end end,

          -- same red as return statements
          fg = '#f45a60'
        },
        {
          text = function(buffer) if buffer.is_modified then return '󰆓 ' else return '' end end,
        },
        {
          text = '󰅖',
          on_click = function(_, _, _, _, buffer)
            buffer:delete()
          end
        },
        {
          text = ' ',
        }
      },
    })

    nnoremap('H', '<Plug>(cokeline-focus-prev)', 'Focus previous buffer')
    nnoremap('L', '<Plug>(cokeline-focus-next)', 'Focus Next buffer')
    nnoremap('X', '<Plug>(cokeline-pick-close)', 'Pick Close')
  end
}
