{ inputs, lib, system, pkgs, hyprland, ... }:

{
  imports = [ hyprland.homeManagerModules.default ];
  wayland.windowManager.hyprland = {
    enable = true;

    #plugins = [
    #  inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
    #  inputs.unofficial-hyprland-plugins.packages.${pkgs.system}.split-monitor-workspaces
    #];

    extraConfig = ''
      # Monitor setup
      monitor=DP-3, 3440x1440@144, 1920x188, 1
      monitor=DP-1, 1920x1080@144, 5360x0, 1, transform, 3
      monitor=HDMI-A-1, 1920x1080@120, 0x188, 1

      # primary display for xwayland / games
      exec-once = xrandr --output DP-3 --mode 3440x1440 --primary

      # Screen share
      exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      #exec-once=systemctl --user import-environment DISPLAY WAYLAND_DISPLAY SWAYSOCK
      #exec-once=hash dbus-update-activation-environment 2>/dev/null && dbus-update-activation-environment --systemd DISPLAY WAYLAND_ DISPLAY SWAYSOCK

      # Default workspace
      workspace = HDMI-A-1, 1
      workspace = DP-3, 2
      workspace = DP-1, 3


      # Environment Variables
      env = WLR_NO_HARDWARE_CURSORS,             1
      env = _JAVA_AWT_WM_NONREPARENTING,         1
      #env = MOZ_ENABLE_WAYLAND,                  1

      ## Toolkit Backend Variables
      env = GDK_BACKEND,                         wayland,x11
      env = QT_QPA_PLATFORM,                     wayland;xcb
      env = SDL_VIDEODRIVER,                     wayland
      env = CLUTTER_BACKEND,                     wayland

      ## XDG Specifications
      env = XDG_CURRENT_DESKTOP,                 Hyprland
      env = XDG_SESSION_TYPE,                    wayland
      env = XDG_SESSION_DESKTOP,                 Hyprland

      ## QT Variables
      env = QT_AUTO_SCREEN_SCALE_FACTOR,         1
      env = QT_QPA_PLATFORM,                     wayland;xcb
      env = QT_WAYLAND_DISABLE_WINDOWDECORATION, 1
      env = QT_QPA_PLATFORMTHEME,                qt5ct

      ## NVIDIA Specific
      env = GBM_BACKEND,                         nvidia_drm
      env = __GLX_VENDOR_LIBRARY_NAME,           nvidia
      env = LIBVA_DRIVER_NAME,                   nvidia
      env = __GL_GSYNC_ALLOWED,                  0
      env = __GL_VRR_ALLOWED,                    0
      env = WLR_DRM_NO_ATOMIC,                   1

      ## Theming Related Variables
      #env = GTK_THEME,
      #env = XCURSOR_THEME,
      env = XCURSOR_SIZE,                        24

      general {
        gaps_in = 5
        gaps_out = 10
        border_size = 2
        #no_border_on_floating = true
        col.active_border = rgba(7287fdee) rgba(e6e9efaa) 45deg
        col.inactive_border = rgba(179299aa)

        layout = dwindle
        #layout = master
      }

      decoration {
        rounding = 8

        blur {
          enabled = true
          size = 5
          passes = 1
          new_optimizations = true
        }
      }

      input {
        kb_layout = us,ca
        kb_options = grp:alt_shift_toggle

        follow_mouse = true

        numlock_by_default = true
      }
      misc {
        mouse_move_enables_dpms = true
        key_press_enables_dpms = true
        disable_hyprland_logo = true
      }

      dwindle {
        no_gaps_when_only = true
      }

      master {
        new_is_master = true
        no_gaps_when_only = true
        new_on_top = true
        inherit_fullscreen = true
      }

      # Keybind
      $modKey = SUPER

      bind = $modKey, space, exec, pkill wofi || wofi --show=drun
      bind = $modKey, Return, exec, alacritty
      bind = $modKey, B, exec, firefox
      bind = $modKey_SHIFT, B, exec, firefox -private-window
      bind = $modKey, E, exec, pcmanfm

      bind = $modKey, Q, exec, '' + ./. + ''/scripts/minimizeSteam.sh
      bind = $modKey, Escape, exec, wlogout

      bind = $modKey, mouse:272, bringactivetotop
      bindm = $modKey, mouse:272, movewindow
      bind = $modKey, mouse:273, bringactivetotop
      #bind = $modKey, mouse:273, movecursortocorner, 1
      bindm = $modKey, mouse:273, resizewindow

      bind = $modKey, F, togglefloating
      bind = $modKey_SHIFT, F, fullscreen
      bind = $modKey, M, fullscreen, 1
      bind = $modKey, Up, pin

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

      bind = $modKey, Left, workspace, r-1
      bind = $modKey, Right, workspace, r+1

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

      bind = $modKey + SHIFT, Left, movetoworkspace, r-1
      bind = $modKey + SHIFT, Right, movetoworkspace, r+1

      # MultiMedia
      bind = , XF86AudioRaiseVolume, exec, pamixer -i 5
      bind = , XF86AudioLowerVolume, exec, pamixer -d 5
      bind = , XF86AudioMute,        exec, pamixer -t
      bind = , XF86AudioPlay,        exec, playerctl play-pause
      bind = , XF86AudioNext,        exec, playerctl next
      bind = , XF86AudioPrev,        exec, playerctl previous



      # Window rules
      windowrulev2 = float,class:^(pcmanfm)$,title:^(Removable medium is inserted)$
      windowrulev2 = float,title:^(Bluetooth Devices)$
      windowrulev2 = float,title:^(Authentication Required — PolicyKit1 KDE Agent)$
      #windowrulev2 = idleinhibit fullscreen,title:^(*)$

      # autostart
      exec-once = swww init &    # wallpaper
      exec-once = sleep 1;swww img -o DP-3 ~/disk/ssd/wallpapers/3440x1440/yor-forger-flower-field-spy-x-family-moewalls-com.gif
      exec-once = sleep 1;swww img -o DP-1 ~/disk/ssd/wallpapers/1080x1920/Anime\ field\ at\ dusk
      exec-once = sleep 1;swww img -o HDMI-A-1 ~/disk/ssd/wallpapers/1920x1080/anime-girl-looking-at-beach-desktop-wallpaperwaifu.com.gif
      exec-once = '' + ./. + ''/scripts/waybar.sh
      #exec-once = swayidle -w timeout 540 "swaylock" timeout 600 "hyprctl dispatch dpms off"
      exec-once = swayidle -w timeout 600 "hyprctl dispatch dpms off"
      exec-once = blueman-applet
      exec-once = nm-applet --indicator
      exec-once = /nix/store/$(ls -la /nix/store | grep 'polkit-kde-agent' | grep '4096' | awk '{print $9}' | sed -n '$p')/libexec/polkit-kde-authentication-agent-1 &
      exec-once = pcmanfm -d      # daemon for pcmanfm
      exec-once = sleep 1;hyprctl dispatch workspace 2
    '';
  };
}
