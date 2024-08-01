local ls = require('luasnip')

local M = {}

function M.expand_or_jump()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end

function M.jump_next()
	if ls.jumpable(1) then
		ls.jump(1)
	end
end

function M.jump_prev()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end

function M.change_choice()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end

function M.reload_package(package_name)
	for module_name, _ in pairs(package.loaded) do
		if string.find(module_name, '^' .. package_name) then
			package.loaded[module_name] = nil
			require(module_name)
		end
	end
end

function M.refresh_snippets()
	ls.cleanup()
	M.reload_package('<update the module name here>')
end

local set = vim.keymap.set

local mode = { 'i', 's' }
local normal = { 'n' }

set(mode, 'kk', M.expand_or_jump)
set(mode, 'kj', M.jump_prev)
set(mode, 'kl', M.jump_next)
set(normal, ',r', M.refresh_snippets)

-- SNIPPET
local s = ls.snippet
local t = ls.text_node

ls.add_snippets('lua', {
    s('h', t('hello world')),
})

