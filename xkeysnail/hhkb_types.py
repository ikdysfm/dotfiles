# -*- coding: utf-8 -*-

import re
from xkeysnail.transform import *

# [Global modemap] Change modifier keys as in xmodmap
define_modmap({
    Key.MUHENKAN: Key.LEFT_META,
    Key.HENKAN: Key.RIGHT_CTRL,
})

# [Conditional modmap] Change modifier keys in certain applications
# define_conditional_modmap(re.compile(r'Emacs'), {
#     Key.RIGHT_CTRL: Key.ESC,
# })

# [Multipurpose modmap] Give a key two meanings. A normal key when pressed and
# released, and a modifier key when held down with another key. See Xcape,
# Carabiner and caps2esc for ideas and concept.
# define_multipurpose_modmap(
    # Enter is enter when pressed and released. Control when held down.
    # {Key.ENTER: [Key.ENTER, Key.RIGHT_CTRL]}

    # Capslock is escape when pressed and released. Control when held down.
    # {Key.CAPSLOCK: [Key.ESC, Key.LEFT_CTRL]
    # To use this example, you can't remap capslock with define_modmap.
# )

define_keymap(None, { # 特定のアプリのみ有効にしたい場合はNoneではなくre.compile("Firefox|Google-chrome")など
    K("C-left_brace"): K("esc"),
    K("C-h"): K("backspace"),

    K("Super-space"): K("right_meta"), # gnome-tweaksで右METAをアクティビティのショートカットにしてある前提
    K("Super-e"): launch(["nautilus"]),
    K("Super-q"): K("M-f4"),
    K("Super-t"): launch(["gnome-terminal"]),
    
    # modifierをスルーする指定はできないっぽい？とりあえず羅列
    K("Super-h"): K("left"),
    K("Super-j"): K("down"),
    K("Super-k"): K("up"),
    K("Super-l"): K("right"),
    K("Super-Shift-h"): K("Shift-left"),
    K("Super-Shift-j"): K("Shift-down"),
    K("Super-Shift-k"): K("Shift-up"),
    K("Super-Shift-l"): K("Shift-right"),
    K("Super-M-h"): K("M-left"),
    K("Super-M-j"): K("M-down"),
    K("Super-M-k"): K("M-up"),
    K("Super-M-l"): K("M-right"),

    # サンプルよりその他の書き方
    # K("C-o"): [K("C-a"), K("C-c"), launch(["gedit"]), sleep(0.5), K("C-v")]
    #     K("C-x"): {
    #     K("h"): [K("C-home"), K("C-a"), set_mark(True)],
    #     K("C-g"): pass_through_key,
    # }
}, "Global")
