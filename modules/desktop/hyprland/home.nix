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

      bindr=SUPER, SUPER_L, exec, pkill wofi || wofi --show drun

      bind = $modKey, Q, '' + ./. + ''/scripts/minimizeSteam.sh
      bind = $modKey, Escape, exit

      bindm = $modKey, mouse:272, movewindow
      bindm = $modKey, mouse:272, bringactivetotop
      bindm = $modKey, mouse:273, resizewindow
      bindm = $modKey, mouse:273, bringactivetotop

      bind = $modKey, F, fullscreen
      bind = $modKey, Space, togglefloating

      bind = $modKey, Tab, cyclenext
      bind = $modKey, Tab, bringactivetotop

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

      bind = $modKey, Left, workspace, m-1
      bind = $modKey, Right, workspace, m+1

      bind = $modKey + SHIFT, 1, movetoworkspace, 1
      bind = $modKey + SHIFT, 2, movetoworkspace, 2
      bind = $modKey + SHIFT, 3, movetoworkspace, 3
      bind = $modKey + SHIFT, 4, movetoworkspace, 4
      bind = $modKey + SHIFT, 5, movetoworkspace, 5
      bind = $modKey + SHIFT, 6, movetoworkspace, 6
      bind = $modKey + SHIFT, 7, movetoworkspace, 7
      bind = $modKey + SHIFT, 8, movetoworkspace, 8
      bind = $modKey + SHIFT, 9, movetoworkspace, 9
      bind = $modKey + SHIFT, 0, movetoworkspace, 10

      bind = $modKey + SHIFT, Left, movetoworkspace, m-1
      bind = $modKey + SHIFT, Right, movetoworkspace, m+1
    '';
  };
}
