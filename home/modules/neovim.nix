{ config, pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    # Enable treesitter, lsp, etc. (via Neovim extras)
    extraPackages = with pkgs; [
      tree-sitter
      nodejs
      python3
      gcc
      lua-language-server
    ];

    plugins = with pkgs.vimPlugins; [
      # Example plugins
      vim-nix
      nvim-treesitter.withAllGrammars
      telescope-nvim
      plenary-nvim
      nvim-lspconfig
      gruvbox-nvim
      lualine-nvim
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

      " Gruvbox theme
      colorscheme gruvbox

      " Lualine config
      lua << EOF
        require('lualine').setup()
        require('lspconfig').lua_ls.setup({})
      EOF
    '';
  };
}


