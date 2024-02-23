return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    require('ibl').setup({
      enabled = true,
      indent = {
        char = '┆'
      }
    })
  end
}
