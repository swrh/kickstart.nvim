local M = {}

M.general = {
  i = {
    ['<C-h>'] = { '<Left>', 'Move left' },
    ['<C-l>'] = { '<Right>', 'Move right' },
    ['<C-j>'] = { '<Down>', 'Move down' },
    ['<C-k>'] = { '<Up>', 'Move up' },

    ['jk'] = { '<ESC>', 'Escape insert mode', opts = { nowait = true } },
  },

  n = {
    ['<C-h>'] = { '<C-w>h', 'Window left' },
    ['<C-l>'] = { '<C-w>l', 'Window right' },
    ['<C-j>'] = { '<C-w>j', 'Window down' },
    ['<C-k>'] = { '<C-w>k', 'Window up' },

    ['<bslash>'] = { '<Cmd>split<CR>', 'Split window horizontally' },
    ['<bar>'] = { '<Cmd>vsplit<CR>', 'Split window vertically' },

    ['<C-_>'] = { '<C-w>-', 'Decrease current window height' },
    ['<C-=>'] = { '<C-w>+', 'Increase current window height' },
    ['<C-<>'] = { '<C-w><', 'Decrease current window width' },
    ['<C->>'] = { '<C-w>>', 'Increase current window width' },
    ['<C-q>'] = { '<Cmd>q<CR>', 'Quit' },

    ['<Leader>tl'] = { '<Cmd>set list!<CR>', 'Toggle list' },
    ['<Leader>tp'] = { '<Cmd>set paste!<CR>', 'Toggle paste' },
    ['<Leader>ts'] = { '<Cmd>set spell!<CR>', 'Toggle spell' },
    ['<Leader>tu'] = { '<Cmd>UndotreeToggle<CR>', 'Undotree' },

    ['<C-n>'] = { '<Cmd>cnext<CR>zz', 'QuickList next' },
    ['<C-p>'] = { '<Cmd>cprevious<CR>zz', 'QuickList previous' },

    [']f'] = { '<Cmd>next<CR>', 'Next file' },
    ['[f'] = { '<Cmd>previous<CR>', 'Previous file' },

    ['<M-k>'] = { '<Cmd>move -2<CR>', 'Move line up' },
    ['<M-j>'] = { '<Cmd>move +1<CR>', 'Move line down' },

    ['<Leader>qq'] = { '<Cmd>qa<CR>', ':qa' },
    ['<Leader>ww'] = { '<Cmd>wa<CR>', ':wa' },
    ['<Leader>wq'] = { '<Cmd>wqa<CR>', ':wqa' },

    ['<Leader>xga'] = { '<Cmd>!git add %<CR>', 'git add' },
    ['<Leader>xgc'] = { '<Cmd>!git commit -m % %<CR>', 'git commit' },
    ['<Leader>xjq'] = { '<Cmd>w !jq .<CR>', 'jq .' },
    ['<Leader>xs'] = { '<Cmd>%!sort<CR>gv', 'sort' },
    ['<Leader>xu'] = { '<Cmd>%!uniq<CR>gv', 'uniq' },
    ['<Leader>xx'] = { '<Cmd>!chmod +x %<CR>', 'chmod +x' },
  },

  t = {
    ['<C-x>'] = { vim.api.nvim_replace_termcodes('<C-bslash><C-N>', true, true, true), 'Escape terminal mode' },
  },

  v = {
    ['<M-k>'] = { ":move '<-2<CR>gv=gv", 'Move line up' },
    ['<M-j>'] = { ":move '>+1<CR>gv=gv", 'Move line down' },

    ['<Leader>xs'] = { '!sort<CR>gv', 'sort' },
    ['<Leader>xu'] = { '!uniq<CR>gv', 'uniq' },
  },

  x = {
    ['p'] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Don't copy replaced text", opts = { silent = true } },
  },
}

M.lspconfig = {
  n = {
    ['<Leader>fm'] = { vim.lsp.buf.format, 'LSP formatting' },
  },
}

M.whichkey = {
  n = {
    ['<Leader>wk'] = { '<Cmd>WhichKey<CR>', 'Which-key all keymaps' },
  },
}

local gitsigns = require 'gitsigns'

M.gitsigns = {
  n = {
    ['<Leader>hs'] = { gitsigns.stage_hunk, 'Git stage hunk' },
    ['<Leader>hr'] = { gitsigns.reset_hunk, 'Git reset hunk' },
    ['<Leader>hp'] = { gitsigns.preview_hunk, 'Git preview hunk' },
    ['<Leader>hu'] = { gitsigns.undo_stage_hunk, 'Git undo stage hunk' },
    ['<Leader>hR'] = { gitsigns.reset_buffer, 'Git reset buffer' },
    ['<Leader>hS'] = { gitsigns.stage_buffer, 'Git stage buffer' },
    ['<Leader>hd'] = { gitsigns.diffthis, 'Git diff .' },
    ['<Leader>hD'] = {
      function()
        gitsigns.diffthis '~'
      end,
      'Git diff ~',
    },
    ['<Leader>hb'] = { gitsigns.blame_line, 'Git blame line' },
    ['<Leader>hB'] = {
      function()
        gitsigns.blame_line { full = true }
      end,
      'Git blame line full',
    },
    ['<Leader>gd'] = { gitsigns.toggle_deleted, 'Git deleted (toggle)' },
    ['<Leader>gb'] = { gitsigns.toggle_current_line_blame, 'Git blame (toggle)' },
  },

  v = {
    ['<Leader>hs'] = {
      function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end,
      'Git stage hunk',
    },

    ['<Leader>hr'] = {
      function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end,
      'Git reset hunk',
    },
  },
}

M.telescope = {
  n = {
    ['<Leader>fa'] = { '<Cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>', 'Find all' },
    ['<Leader>fb'] = { '<Cmd>Telescope buffers<CR>', 'Find buffers' },
    ['<Leader>fd'] = { '<Cmd>Telescope diagnostics<CR>', 'Find diagnostics' },
    ['<Leader>ff'] = { '<Cmd>Telescope find_files<CR>', 'Find files' },
    ['<Leader>fg'] = { '<Cmd>Telescope git_files<CR>', 'Git files' },
    ['<Leader>fh'] = { '<Cmd>Telescope help_tags<CR>', 'Help page' },
    ['<Leader>fk'] = { '<Cmd>Telescope marks<CR>', 'Find bookmarks' },
    ['<Leader>fn'] = { function() require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config', } end, 'Neovim files', },
    ['<Leader>fo'] = { '<Cmd>Telescope oldfiles<CR>', 'Find oldfiles' },
    ['<Leader>fr'] = { '<Cmd>Telescope resume<CR>', 'Resume (find)' },
    ['<Leader>fs'] = { '<Cmd>Telescope live_grep<CR>', 'Live grep' },
    ['<Leader>fw'] = { '<Cmd>Telescope grep_string<CR>', 'Find currrent word' },
    ['<Leader>fz'] = { '<Cmd>Telescope current_buffer_fuzzy_find<CR>', 'Find in current buffer' },
    ['<leader>f/'] = { '<Cmd>Telescope live_grep grep_open_files=true prompt_title=Live\\ Grep\\ in\\ Open\\ Files<CR>', 'Find in open files', },

    ['<Leader>gc'] = { '<Cmd>Telescope git_commits<CR>', 'Git commits' },
    ['<Leader>gs'] = { '<Cmd>Telescope git_status<CR>', 'Git status' },
  },
}

M.leap = {
  n = {
    ['gl'] = {
      function()
        require('leap').leap { windows = require('leap.user').get_focusable_windows() }
      end,
      'Leap to',
    },
  },

  v = {
    ['gh'] = { '<Plug>(leap-backward)', 'Leap backward' },
    ['gl'] = { '<Plug>(leap-forward)', 'Leap forward' },
  },
}

return M
