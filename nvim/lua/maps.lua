-- Key remaps
local remap = vim.api.nvim_set_keymap
function noremap(from, to, desc)
  desc = desc or " "
	remap('', from, to, { noremap = true, desc = desc })
end

function nnoremap(from, to, desc)
  desc = desc or " "
	remap('n', from, to, {desc= desc, noremap = true })
end

function vnoremap(from, to, desc)
	remap('v', from, to, { noremap = true, desc = desc })
end
function nmap(from, to)
	remap('n', from, to, {})
end

function vmap(from, to)
	remap('v', from, to, {})
end

return {
	noremap = noremap,
	nnoremap = nnoremap,
	vnoremap = vnoremap,
	nmap = nmap,
	vmap = vmap
}
