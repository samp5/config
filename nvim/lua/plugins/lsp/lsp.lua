return {
	{
		"neovim/nvim-lspconfig",
	dependencies = {
      {"hrsh7th/cmp-nvim-lsp"},
      {"SmiteshP/nvim-navic"},
		},
  config = function()
    -- import lspconfig plugin

    local on_attach = function(client, bufnr)

			local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr,...) end

			require "lsp-format".on_attach(client)
			require 'nvim-navic'.attach(client, bufnr)

    end

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local lspconfig = require("lspconfig")
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- configure python server
    lspconfig.pyright.setup{
      on_attach = on_attach,
    }

		--configure mdx
		lspconfig["mdx_analyzer"].setup{
			on_attach = on_attach,
		}

		-- configure c++ server
		lspconfig.clangd.setup {
      capabilities = capabilities,
			on_attach = function(client, bufnr)
        local navic = require("nvim-navic")
        navic.attach(client, bufnr)
      end,
			cmd = {
				"clangd",
				"--completion-style=bundled",
				"--clang-tidy",
				"--cross-file-rename",
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

