return {
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" }, -- loads for new files or new buffers
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "SmiteshP/nvim-navic" },
      { "p00f/clangd_extensions.nvim" },
      { "lukas-reineke/lsp-format.nvim" },
    },
    config = function()
      -- import lspconfig plugin
      local lspconfig = require("lspconfig")

      -- Error icons
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      local maps = require('maps')
      local bnnoremap = maps.bnnoremap

      local on_attach = function(client, bufnr)
        -- formatting and context
        require("lsp-format").on_attach(client, bufnr)
        require 'nvim-navic'.attach(client, bufnr)

        -- buffer remaps
        bnnoremap('<leader>i', '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature help', bufnr)
        bnnoremap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Go to declaration', bufnr)
        bnnoremap('gi', '<cmd>Telescope lsp_implementations()<CR>', 'Telescope implementation', bufnr)
        bnnoremap('<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', 'See code actions', bufnr)
        bnnoremap('<space>sn', '<cmd>lua vim.lsp.buf.rename()<CR>', 'Smart Rename', bufnr)
        bnnoremap('K', '<cmd>lua vim.lsp.buf.hover()<CR>', 'Hover', bufnr)
        bnnoremap('<leader>D', '<cmd>vim.diagnostic.open_float<CR>', 'Show diagnostics for line', bufnr) -- show diagnostics for line
        bnnoremap('gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>', 'go defintion', bufnr)
      end

      local clang_attach = function(client, bufnr)
        require("lsp-format").on_attach(client, bufnr)
        require 'nvim-navic'.attach(client, bufnr)

        -- clangd_extensions tools
        require("clangd_extensions.inlay_hints").setup_autocmd()
        require("clangd_extensions.inlay_hints").set_inlay_hints()

        -- regular buffer maps
        bnnoremap('<leader>i', '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature help', bufnr)
        bnnoremap('<leader>tD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Type definition', bufnr)
        bnnoremap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Go to declaration', bufnr)
        bnnoremap('gi', '<cmd>Telescope lsp_implementations()<CR>', 'Telescope implementation', bufnr)
        bnnoremap('<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', 'See code actions', bufnr)
        bnnoremap('<space>sn', '<cmd>lua vim.lsp.buf.rename()<CR>', 'Smart Rename', bufnr)
        bnnoremap('K', '<cmd>lua vim.lsp.buf.hover()<CR>', 'Hover', bufnr)
        bnnoremap('<leader>D', '<cmd>Telescope diagnostics bufnr=1<CR>', 'Telescope Diagnostics', bufnr) -- show  diagnostics for fil, bufnre
        bnnoremap('<leader>d', '<cmd>vim.diagnostic.open_float<CR>', 'Show diagnostics for line', bufnr) -- show diagnostics for line
        bnnoremap('<leader>ct', '<cmd>ClangdAST<CR>', 'Abstract Syntax Tree', bufnr)
        bnnoremap('<leader>cu', '<cmd>ClangdMemoryUsage<CR>', 'Clangd Memory Usage', bufnr)
        bnnoremap('<leader>k', '<cmd>ClangdSymbolInfo<CR>', 'ClangdSymbolInfo', bufnr)
      end



      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- configure python server
      lspconfig.pyright.setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      --configure mdx
      lspconfig["mdx_analyzer"].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      -- configure c++ server
      lspconfig.clangd.setup {
        capabilities = capabilities,
        on_attach = clang_attach,
        cmd = {
          "clangd",
          -- "--completion-style=detailed",
          -- "--clang-tidy",
          -- "--clang-tidy-checks=*",
          -- "--cross-file-rename",
        }
      }

      ---- configure css server
      lspconfig["cssls"].setup({
        on_attach = on_attach,
      })
      -- configure javascript server
      lspconfig["tsserver"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- configure html server
      lspconfig["html"].setup({
        on_attach = on_attach,
      })
      -- configure tailwindcss server
      lspconfig["tailwindcss"].setup({
        on_attach = on_attach,
      })

      -- configure lua server (with special settings)
      lspconfig["lua_ls"].setup({
        on_attach = on_attach,
        settings = { -- custom settings for lua
          Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              -- make language server aware of runtime files
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })
    end,
  }
}
