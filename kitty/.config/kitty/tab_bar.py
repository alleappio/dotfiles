# pyright: reportMissingImports=false
import socket

from kitty.boss import get_boss
from kitty.fast_data_types import Screen, add_timer, get_options
from kitty.tab_bar import (
    DrawData,
    ExtraData,
    Formatter,
    TabBarData,
    as_rgb,
    draw_attributed_string,
    draw_tab_with_powerline,
    draw_tab_with_separator,
)
from kitty.utils import color_as_int

opts = get_options()


def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:

    if tab.layout_name == "stack":
        screen.draw("\uf002 ")

    draw_tab_with_separator(
        draw_data, screen, tab, before, max_title_length, index, is_last, extra_data
    )

    if is_last:
        draw_right_status(draw_data, screen, tab)
    return screen.cursor.x


def draw_right_status(draw_data: DrawData, screen: Screen, tabBarData: TabBarData) -> None:
    # The tabs may have left some formats enabled. Disable them now.
    draw_attributed_string(Formatter.reset, screen)
    to_draw = [
        tabBarData.session_name,
        # socket.gethostname()
    ]

    # start from the number of separators (the number of elements)
    # to_draw_len = len(to_draw)*3
    to_draw_len = len(to_draw)*2

    # add the length of the items
    for i in to_draw:
        to_draw_len+=len(i)
    padding = screen.columns - screen.cursor.x - to_draw_len

    if padding:
        screen.draw(" " * padding)

    screen.cursor.bg = as_rgb(color_as_int(opts.background))
    screen.cursor.fg = as_rgb(color_as_int(opts.active_tab_background))
    # screen.draw("\ue0b2")
    screen.cursor.fg = as_rgb(color_as_int(opts.background))
    screen.cursor.bg = as_rgb(color_as_int(opts.active_tab_background))
    screen.cursor.bold = True
    for i in to_draw:
        screen.draw(f" {i} ")
        if to_draw.index(i) < len(to_draw)-1:
            screen.draw("\ue0b3")


def _redraw_tab_bar(timer_id):
    for tm in get_boss().all_tab_managers:
        tm.mark_tab_bar_dirty()
