{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig = ''
      # Monitor setup
      monitor=DP-3, 3440x1440@144, 1920x188, 1
      monitor=DP-2, 1920x1080@144, 5360x0, 1, transform, 3
      monitor=HDMI-A-1, 1920x1080@120, 0x188, 1

      # primary display for xwayland / games
      exec-once = xrandr --output DP-3 --primary

      # Screen share
      exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      #exec-once=systemctl --user import-environment DISPLAY WAYLAND_DISPLAY SWAYSOCK
      #exec-once=hash dbus-update-activation-environment 2>/dev/null && dbus-update-activation-environment --systemd DISPLAY WAYLAND_ DISPLAY SWAYSOCK

      # Default workspace
      workspace = HDMI-A-1, 1
      workspace = DP-3, 2
      workspace = DP-2, 3

      # environment variable
      env = XDG_CURRENT_DESKTOP,Hyprland
      env = XDG_SESSION_TYPE,wayland
      env = XDG_SESSION_DESKTOP,Hyprland
      env = MOZ_ENABLE_WAYLAND,1
      env = _JAVA_AWT_WM_NONREPARENTING,1
      env = XCURSOR_SIZE,24
      env = QT_AUTO_SCREEN_SCALE_FACTOR,1
      #env = QT_QPA_PLATFORM,wayland;xcb
      env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
      env = QT_QPA_PLATFORMTHEME,qt5ct
      env = GBM_BACKEND,nvidia-drm
      env = LIBVA_DRIVER_NAME,nvidia
      env = __GL_GSYNC_ALLOWED,0
      env = __GL_VRR_ALLOWED,0
      env = WLR_DRM_NO_ATOMIC,1
      #env = SDL_VIDEODRIVER,wayland
      #env = CLUTTER_BACKEND,wayland
      #env = GDK_BACKEND,wayland
      env = WLR_NO_HARDWARE_CURSORS,1

      env = __NV_PRIME_RENDER_OFFLOAD,1
      env = __GLX_VENDOR_LIBRARY_NAME,nvidia
      env = __VK_LAYER_NV_optimus,NVIDIA_only


      general {
        gaps_in = 5
        gaps_out = 10
        border_size = 2
        col.active_border = rgba(7287fdee) rgba(e6e9efaa) 45deg
        col.inactive_border = rgba(179299aa)

        #layout = dwindle
        layout = master
      }

      decoration {
      rounding = 8
      blur = yes
      blur_size = 5
      blur_passes = 1
      blur_new_optimizations = on
      }

      input {
        kb_layout = us
        follow_mouse = true

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

      # Keybind
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

      # autostart
      exec-once = waybar
      exec-once = swayidle -w timeout 600 "hyprctl dispatch dpms off"
      exec-once = blueman-applet
      exec-once = nm-applet --indicator
      exec-once = /nix/store/$(ls -la /nix/store | grep 'polkit-kde-agent' | grep '4096' | awk '{print $9}' | sed -n '$p')/libexec/polkit-kde-authentication-agent-1 &

      # Set wallpapers
      $WallpaperDir = /home/raphael/disk/ssd/wallpapers
      exec-once = swww init
      exec-once = sleep 1; swww img -o HDMI-A-1 /home/raphael/disk/ssd/wallpapers/Anime\ Gif\ Wallpaper\ Hd\ :\ Masaüstü,Arkaplan,Walpaper\ hareketli.gif
      exec-once = sleep 1; swww img -o DP-3 $WallpaperDir/Anime\ Girl\ Alone\ At\ Mountain\ Cliff.jpg
      exec-once = sleep 1; swww img -o DP-2 $WallpaperDir/wp6070036-sad-sunset-anime-wallpapers.jpg
    '';
  };
}
