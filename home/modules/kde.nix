{ pkgs, config, ... }:

{
  programs.plasma = {
    enable = true;

    workspace = {
      cursorTheme = "Breeze_Snow";
      lookAndFeel = "org.kde.breezedark.desktop";
      colorScheme = "BreezeDark";
      font = {
        general = {
          family = "Noto Sans";
          pointSize = 10;
        };
        fixedWidth = {
          family = "Fira Code";
          pointSize = 10;
        };
      };
    };

    panels = [
      {
        location = "bottom";
        height = 36;
        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.pager"
          "org.kde.plasma.taskmanager"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
        ];
      }
    ];
  };
}

