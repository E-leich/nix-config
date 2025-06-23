{ config, pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    # Enable treesitter, LSP, etc.
    extraPackages = with pkgs; [
      tree-sitter
      nodejs
      python3
      gcc
      lua-language-server
    ];

    plugins = with pkgs.vimPlugins; [
      # Base + appearance
      vim-nix
      nvim-treesitter.withAllGrammars
      gruvbox-nvim
      lualine-nvim

      # Telescope
      telescope-nvim
      plenary-nvim

      # LSP
      nvim-lspconfig

      # File tree
      nvim-tree-lua
      nvim-web-devicons
    ];

    extraConfig = ''
      set number
      syntax on
      set tabstop=4 shiftwidth=4 expandtab
      set mouse=a
      set clipboard=unnamedplus

      " Set <Space> as leader key
      let mapleader = " "

      " Telescope keybind
      nnoremap <leader>f <cmd>Telescope find_files<cr>

      " NvimTree toggle
      nnoremap <leader>t :NvimTreeToggle<CR>

      " Colorscheme
      colorscheme gruvbox

      lua << EOF
        require('lualine').setup()

        require('lspconfig').lua_ls.setup({})

        require('nvim-tree').setup({
          view = {
            width = 30,
            side = "left",
            preserve_window_proportions = true,
          },
          renderer = {
            icons = {
              show = {
                git = true,
                folder = true,
                file = true,
                folder_arrow = true,
              }
            }
          },
          filters = {
            dotfiles = false
          },
          actions = {
            open_file = {
              quit_on_open = true,  -- auto-close tree when opening file
            }
          },
          git = {
            enable = true
          }
        })
      EOF
    '';
  };
}

