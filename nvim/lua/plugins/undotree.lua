local nnoremap = require("maps").nnoremap
return {
  "mbbill/undotree",
  config = function()
    nnoremap("<leader><F5>", '<cmd>UndotreeToggle<CR>', 'Undotree')
  end,
}
