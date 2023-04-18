{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig = ''
      monitor=DP-3, 3440x1440@144, 1920x188, 1
      monitor=DP-2, 1920x1080@144, 5360x0, 1, transform, 3
      monitor=HDMI-A-1, 1920x1080@120, 0x188, 1

      $modKey = SUPER

      bind = $modKey, Return, exec, alacritty

      bind = $modKey, P, exec, wofi --show drun
      bind = $modKey, Q, killactive
      bind = $modKey, Escape, exit

      bindm = $modKey, mouse:272, movewindow
      bindm = $modKey, mouse:273, resizewindow

      bind = $modKey, 1, workspace, 1
      bind = $modKey, 2, workspace, 2
      bind = $modKey, 3, workspace, 3
      bind = $modKey, 4, workspace, 4
      bind = $modKey, 5, workspace, 5
      bind = $modKey, 6, workspace, 6
      bind = $modKey, 7, workspace, 7
      bind = $modKey, 8, workspace, 8
      bind = $modKey, 9, workspace, 9
      bind = $modKey, 0, workspace, 10
    '';
  };
}
