# !! Currently disabled
_: {
  services = {
    yabai = {
      enable = true;
      extraConfig = ''
        # bsp, stack or float
        yabai -m config layout bsp

        yabai -m config window_placement second_child

        # padding
        yabai -m config window_gap 12
        yabai -m config top_padding 4
        yabai -m config bottom_padding 4
        yabai -m config right_padding 4
        yabai -m config left_padding 4

        # mouse settings
        yabai -m config mouse_follows_focus on
        yabai -m config mouse_modifier alt
        # left click and drag
        yabai -m config mouse_action1 move
        # right click and drag
        yabai -m config mouse_action2 resize
        yabai -m config mouse_drop_action swap
      '';
    };
    skhd = {
      enable = true;
      skhdConfig = ''
        # start and stop
        ctrl + alt - q: yabai --stop-service
        ctrl + alt - s: yabai --start-service

        # changing window focus
        alt - h : yabai -m window --focus west || yabai -m display --focus west
        alt - j : yabai -m window --focus south || yabai -m display --focus south
        alt - k : yabai -m window --focus north || yabai -m display --focus north
        alt - l : yabai -m window --focus east || yabai -m display --focus east

        # swap windows
        shift + alt - h: yabai -m window --warp west || yabai -m window --display west && yabai -m display --focus north
        shift + alt - j: yabai -m window --warp south || yabai -m window --display south && yabai -m display --focus south
        shift + alt - k: yabai -m window --warp north || yabai -m window --display north && yabai -m display --focus north
        shift + alt - l: yabai -m window --warp east || yabai -m window --display east && yabai -m display --focus east

        # rotate layout clockwise
        shift + alt - c: yabai -m space --rotate 270

        # rotate layout anti-clockwise
        shift + alt - a: yabai -m space --rotate 270

        # flip alone x-axis
        shift + alt - x: yabai -m space -- mirror x-axis

        # flip along y-axis
        shift + alt - y: yabai -m space --mirror y-axis

        # toggle window float
        shift + alt - t: yabai -m window --toggle float --grid 4:4:1:1:2:2

        # maximize a window
        shift + alt - m: yabai -m window --toggle zoom-fullscreen

        # reset window size
        shift + alt - e: yabai -m space --balance
      '';
    };
  };
}
