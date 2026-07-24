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

def fill_template(template_file, colors, output_file):
    with open(template_file, "r") as f:
        template = f.read()

    output = template.format_map(colors)

    with open(output_file, "w") as f:
        f.write(output)

def gen_plasma_colors(colors):
    plasma_template_file = f"{os.environ["HOME"]}/dotfiles/plasma/colors.colors.template"
    plasma_output_file = f"{os.environ["HOME"]}/.local/share/color-schemes/{colors["scheme_id"]}.colors"

    fill_template(plasma_template_file, colors, plasma_output_file)

def main():
    if len(sys.argv) != 2:
        help()

    colorscheme_name = sys.argv[1]
    colorscheme_file = f"themes/{colorscheme_name}.toml"
    templates_dir = "templates"
    output_dir = f"outputs/{colorscheme_name}"
    # if not os.path.isfile(colorscheme_file):
    #     print("colorscheme {colorscheme} not found")
    #     help()

    with open(colorscheme_file, "rb") as f:
        tot = tomllib.load(f)
        colorscheme = {}
        desc = {}
        print(f"reading: {colorscheme_file}")
        try:
            colorscheme = tot
            found = True
        except KeyError as e:
            print(e)
            help()

    colorscheme["accent_color"] = colorscheme[f"{colorscheme["primary_color_name"]}_color"]
    colorscheme["neovim_theme_opts"] = "\n".join(colorscheme["neovim_theme_opts"])

    colors = {
        "scheme_id":          colorscheme_name,
        "scheme_name":        colorscheme_name,
        "background_rgb":          hex_to_rgb(colorscheme["background_color"]),
        "background_alt_rgb":      hex_to_rgb(colorscheme["background_alt_color"]),
        "foreground_rgb":          hex_to_rgb(colorscheme["foreground_color"]),
        "foreground_inactive_rgb": hex_to_rgb(colorscheme["foreground_color"]),
        "red_rgb":                 hex_to_rgb(colorscheme["red_color"]),
        "green_rgb":               hex_to_rgb(colorscheme["green_color"]),
        "yellow_rgb":              hex_to_rgb(colorscheme["yellow_color"]),
        "blue_rgb":                hex_to_rgb(colorscheme["blue_color"]),
        "purple_rgb":              hex_to_rgb(colorscheme["magenta_color"]),
        "accent_rgb":              hex_to_rgb(colorscheme["accent_color"]),
        "hover_rgb":               hex_to_rgb(colorscheme["background_alt_color"]),
    }
    colors = colors | colorscheme
    templates = os.listdir(templates_dir)
    print("templates found:")
    for i in templates:
        print(f"\t{i.split(".")[0]}")
    # gen_plasma_colors(colors)
    for i in templates:
        a = i.split(".")
        app_name = a[0].split("_")[0]
        extension = a[1]
        template_file = f"{templates_dir}/{i}"
        output_file = f"{output_dir}/{".".join(a[:-1])}"
        print(f"Filling {app_name}.{extension} theme")
        # print(f"template file: {template_file}")
        # print(f"optput file: {output_file}")
        fill_template(template_file, colors, output_file)


if __name__ == '__main__':
    main()
