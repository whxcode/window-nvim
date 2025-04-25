-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd([[ 
"set clipboard=unnamedplus
highlight NormalModeCursor guifg=orange guibg=orange
highlight InsertModeCursor guifg=purple guibg=purple
highlight VisualModeCursor guifg=red guibg=red

set guicursor=n-v-c:block-NormalModeCursor
set guicursor+=i:block-InsertModeCursor
set guicursor+=v:block-VisualModeCursor

" autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})
" autocmd CursorMovedI,TextChangedI,TextChangedP * lua require'cmp.utils.autocmd'.emit('TextChanged')

set diffopt=internal,filler,closeoff,vertical
]])

-- 设置背景透明
vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NonText guibg=NONE ctermbg=NONE
]])

vim.cmd([[
    let g:enable_spelunker_vim = 1
    let g:enable_spelunker_vim = 1
    let g:spelunker_check_type = 2

    " Override highlight group name of incorrectly spelled words. (default:
    " 'SpelunkerSpellBad')
    let g:spelunker_spell_bad_group = 'SpelunkerSpellBad'

    " Override highlight group name of complex or compound words. (default:
    " 'SpelunkerComplexOrCompoundWord')
    let g:spelunker_complex_or_compound_word_group = 'SpelunkerComplexOrCompoundWord'

    " Override highlight setting.
    highlight SpelunkerSpellBad cterm=undercurl ctermfg=247 gui=undercurl guifg=#9e9e9e
    highlight SpelunkerComplexOrCompoundWord cterm=undercurl ctermfg=NONE gui=underline guifg=NONE

    set nospell
]])
