{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig = ''
      monitor=DP-3, 3440x1440@144, 1920x188, 1
      monitor=DP-2, 1920x1080@144, 5360x0, 1, transform, 3
      monitor=HDMI-A-1, 1920x1080@120, 0x188, 1

      workspace = HDMI-A-1, 1
      workspace = DP-3, 2
      workspace = DP-2, 3

      env = XDG_CURRENT_DESKTOP,Hyprland
      env = XDG_SESSION_TYPE,wayland
      env = XDG_SESSION_DESKTOP,Hyprland
      env = MOZ_ENABLE_WAYLAND,1
      env = _JAVA_AWT_WM_NONREPARENTING,1

      general {
        layout = master
      }

      decoration {
      rounding = 5
      }

      input {
        numlock_by_default = true
      }
      misc {
        mouse_move_enables_dpms = true
        key_press_enables_dpms = true
      }

      master {
        new_is_master = true
        no_gaps_when_only = true
        new_on_top = true
        inherit_fullscreen = true
      }

      $modKey = SUPER

      bind = $modKey, Return, exec, alacritty

      bindr=SUPER, SUPER_L, exec, pkill wofi || wofi --show drun

      bind = $modKey, Q, exec, '' + ./. + ''/scripts/minimizeSteam.sh
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

      exec-once = waybar

      $WallpaperDir = /home/raphael/disk/ssd/wallpapers
      exec-once = swww init
      exec-once = swww img -o HDMI-A-1 /home/raphael/disk/wallpapers/Anime\ Gif\ Wallpaper\ Hd\ :\ Masaüstü,Arkaplan,Walpaper\ hareketli.gif
      exec-once = swww img -o DP-3 $WallpaperDir/Anime\ Girl\ Alone\ At\ Mountain\ Cliff.jpg
      exec-once = swww img -o DP-2 $WallpaperDir/wp6070036-sad-sunset-anime-wallpapers.jpg
    '';
  };
}
