{
  programs.zsh = {
    enable = true;

    enableCompletion = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      edit = "sudo -e";
      update = "sudo nixos-rebuild switch";
    };

    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
    history.ignorePatterns = [ "rm *" "pkill *" "cp *" ];

    # Uncomment one of the plugin managers below to use plugins

     oh-my-zsh = {
       enable = true;
       plugins = [
         "git"
         "z"
       ];
       theme = "robbyrussell";
     };

    # zplug = {
    #   enable = true;
    #   plugins = [
    #     { name = "zsh-users/zsh-autosuggestions"; }
    #     { name = "romkatv/powerlevel10k"; tags = [ "as:theme" "depth:1" ]; }
    #   ];
    # };

  };
}

