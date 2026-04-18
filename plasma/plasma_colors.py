#!/bin/python3
import sys
import os
import tomllib

def help():
    print(f"Usage: {sys.argv[0]} (colorscheme)")
    exit()

def hex_to_rgb(hex: str) -> str:
    hex = hex.lstrip("#")
    r, g, b = int(hex[0:2], 16), int(hex[2:4], 16), int(hex[4:6], 16)
    return f"{r},{g},{b}"

if len(sys.argv) != 2:
    help()

colorscheme_name = sys.argv[1]
colorscheme_file = f"{os.environ["HOME"]}/dotfiles/themes/{colorscheme_name}/plasma/colors.toml"
if not os.path.isfile(colorscheme_file):
    print("colorscheme {colorscheme} not found")
    help()

with open(colorscheme_file, "rb") as f:
    tot = tomllib.load(f)
    colorscheme = {}
    desc = {}
    try:
        colorscheme = tot["colors"]
        desc = tot["description"]
        found = True
    except KeyError as e:
        print(e)
        help()

colorscheme["accent"] = colorscheme[colorscheme["primary"]]

with open(f"{os.environ["HOME"]}/dotfiles/plasma/colors.colors.template") as f:
    template = f.read()


colors = {
    "scheme_id":          desc["id"],
    "scheme_name":        desc["name"],
    "background":         hex_to_rgb(colorscheme["background"]),
    "background_alt":     hex_to_rgb(colorscheme["background_alt"]),
    "foreground":         hex_to_rgb(colorscheme["foreground"]),
    "foreground_inactive":hex_to_rgb(colorscheme["foreground"]),
    "red":                hex_to_rgb(colorscheme["red"]),
    "green":              hex_to_rgb(colorscheme["green"]),
    "yellow":             hex_to_rgb(colorscheme["yellow"]),
    "blue":               hex_to_rgb(colorscheme["blue"]),
    "purple":             hex_to_rgb(colorscheme["magenta"]),
    "accent":             hex_to_rgb(colorscheme[colorscheme["primary"]]),
    "hover":              hex_to_rgb(colorscheme["background_alt"]),
}

output = template.format_map(colors)

with open(f"{os.environ["HOME"]}/.local/share/color-schemes/{colorscheme_name}.colors", "w") as f:
    f.write(output)
