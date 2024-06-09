# Notwaita Cursor Theme

A cursor theme based off of Adwaita icons from the GNOME Project (Fork).

## Notes

-   All cursor's SVG files are found in [svg](./svg) directory or you can also find them on [Figma](https://www.figma.com/design/pytcdZCnx9NwL6Ao6jFQmb/nowaita?node-id=0-1&t=aeAWgQMBcGylCJyj-1).

<!-- If you're interested, you can learn more about "sponsor-spotlight" on
 https://dev.to/ful1e5/lets-give-recognition-to-those-supporting-our-work-on-github-sponsors-b00 -->

![shoutout-sponsors](https://sponsor-spotlight.vercel.app/sponsor?login=ful1e5)

---

![Notwaita Black]()
![Notwaita White]()
![Notwaita Gray]()

## Cursor Sizes

### Xcursor Sizes:

<kbd>16</kbd>
<kbd>20</kbd>
<kbd>22</kbd>
<kbd>24</kbd>
<kbd>28</kbd>
<kbd>32</kbd>
<kbd>40</kbd>
<kbd>48</kbd>
<kbd>56</kbd>
<kbd>64</kbd>
<kbd>72</kbd>
<kbd>80</kbd>
<kbd>88</kbd>
<kbd>96</kbd>

### Windows Cursor Size:

| size | Regular (× ²⁄₃) | Large (× ⁴⁄₅) | Extra-Large (× 1) |
| ---: | --------------: | ------------: | ----------------: |
|   32 |     21.333 → 22 |     25.6 → 26 |                32 |
|   48 |              32 |     38.4 → 39 |                48 |
|   64 |     42.666 → 43 |     51.2 → 52 |                64 |
|   96 |              64 |     76.8 → 77 |                96 |
|  128 |     85.333 → 86 |   102.4 → 103 |               128 |
|  256 |   170.666 → 171 |   204.8 → 205 |               256 |

## Colors

### Black

-   Base Color - `#000000` (Black)
-   Outline Color - `#FFFFFF` (White)

### White

-   Base Color - `#FFFFFF` (White)
-   Outline Color - `#000000` (Black)

### Gray

-   Base Color - `#404040` (Gray)
-   Outline Color - `#000000` (Black)

## How to get it

You can download latest `stable` & `development` releases from
[Release Page](https://github.com/ful1e5/notwaita-cursor/releases).

## Installing Notwaita Cursor

#### Linux/X11

**Installation:**

```bash
tar -xvf Notwaita-Black.tar.gz                 # extract `.tar.gz`
mv Notwaita-* ~/.icons/                        # Install to local users
sudo mv Notwaita-* /usr/share/icons/           # Install to all users
```

**Uninstallation:**

```bash
rm ~/.icons/Notwaita-*                         # Remove from local users
sudo rm /usr/share/icons/Notwaita-*            # Remove from all users
```

#### Windows

**Installation:**

1. Unzip `.zip` file
2. Open unziped directory in Explorer, and **right click** on `install.inf`.
3. Click 'Install' from the context menu, and authorize the modifications to your system.
4. Open Control Panel > Personalization and Appearance > Change mouse pointers,
   and select **Notwaita Cursors**.
5. Click '**Apply**'.

**Uninstallation:**

Run the `uninstall.bat` script packed with the `.zip` archive

**OR** follow these steps:

1. Go to **Registry Editor** by typing the same in the _start search box_.
2. Expand `HKEY_CURRENT_USER` folder and expand `Control Panel` folder.
3. Go to `Cursors` folder and click on `Schemes` folder - all the available custom cursors that are
   installed will be listed here.
4. **Right Click** on the name of cursor file you want to uninstall; for eg.: _Notwaita Cursors_ and
   click `Delete`.
5. Click '**yes**' when prompted.

## Build From Source

### Prerequisites

-   Python version 3.7 or higher
-   [clickgen](https://github.com/ful1e5/clickgen)>=2.2.5 (`pip install clickgen`)
-   [yarn](https://github.com/yarnpkg/yarn)

### Quick start

1. Install [build prerequisites](#prerequisites) on your system
2. `git clone https://github.com/ful1e5/notwaita-cursor`
3. `cd notwaita-cursor`
4. `yarn install`
5. `yarn generate`
6. See [Installing Notwaita Cursor](#installing-notwaita-cursor).

### Getting Started

Once you have the [build prerequisites](#prerequisites) installed, You can personalize colors,
customize sizes, change target platforms, and more. This process involves using external tools,
as this repository only contains SVG files and configuration for these tools:

-   [cbmp](https://github.com/ful1e5/cbmp): Used for customizing colors and generating PNG files.
-   [ctgen](https://github.com/ful1e5/clickgen): Used for customizing sizes and building XCursor and Windows Cursors.

You can refer to the README of each tool for more information on their command-line options.

#### Crafting Your Notwaita Cursor

The process of creating custom cursor themes involves two main steps:

1. Rendering SVG files to PNG files.
2. Building cursor themes from PNG files.

#### Customize Colors

`cbmp` provides three options for changing colors:

1. `-bc`: Base color, which replaces the `#00FF00` color in the SVG.
2. `-oc`: Outlined color, which replaces the `#0000FF` color in the SVG.
3. `-wc` (optional): Watch Background color, which replaces the `#FF0000` color in the SVG.

```bash
npx cbmp [...] -bc '<hex>' -oc '<hex>' -wc '<hex>'
```

Alternatively, you can provide a JSON configuration file to render SVG files, which contains a sequence of `cbmp` commands:

```bash
npx cbmp render.json
```

#### Customize Sizes

##### Customize Windows Cursor size

To build Windows cursor with size `16`:

```bash
ctgen build.toml -s 16 -p windows -d "bitmaps/Notwaita-Black" -n "Notwaita-Black" -c "Notwaita Black Cursors with size 16"
```

You can also customize output directory with `-o` option:

```bash
ctgen build.toml -s 16 -p windows -d "bitmaps/Notwaita-Black" -o "out" -n "Notwaita-Black" -c "Notwaita Black Cursors with size 16"
```

##### Customize XCursor size

To build XCursor with size `16`:

```bash
ctgen build.toml -s 16 -p x11 -d "bitmaps/Notwaita-Black" -n "Notwaita-Black" -c "Notwaita Black XCursors with size 16"
```

You can also assign multiple sizes to `ctgen` for XCursors build:

```bash
ctgen build.toml -s 16 24 32 -p x11 -d "bitmaps/Notwaita-Black" -n "Notwaita-Black" -c "Custom Sizes Notwaita Black XCursors"
```

#### Examples

Lets generate Notwaita cursor with green and black colors:

```bash
npx cbmp -d "svg" -o "bitmaps/Notwaita-Hacker" -bc "#00FE00" -oc "#000000"
```

After rendering custom color you have to build cursor through `ctgen`:

```bash
ctgen build.toml -d "bitmaps/Notwaita-Hacker" -n "Notwaita-Hacker" -c "Green and Black Notwaita cursors."
```

Afterwards, Generated theme can be found in the `themes` directory.

###### Notwaita Gruvbox

```bash
npx cbmp -d "svg" -o "bitmaps/Notwaita-Gruvbox" -bc "#282828" -oc "#EBDBB2" -wc "#000000"
ctgen build.toml -d "bitmaps/Notwaita-Gruvbox" -n "Notwaita-Gruvbox" -c "Groovy Notwaita cursors."
```

###### Notwaita Solarized Dark

```bash
npx cbmp -d "svg" -o "bitmaps/Notwaita-Solarized-Dark" -bc "#002b36" -oc "#839496" -wc "#000000"
ctgen build.toml -d "bitmaps/Notwaita-Solarized-Dark" -n "Notwaita-Solarized-Dark" -c "Solarized Dark Notwaita cursors."
```

###### Notwaita Solarized Light

```bash
npx cbmp -d "svg" -o "bitmaps/Notwaita-Solarized-Light" -bc "#839496" -oc "#002b36"
ctgen build.toml -d "bitmaps/Notwaita-Solarized-Light" -n "Notwaita-Solarized-Light" -c "Solarized Light Notwaita cursors."
```

###### Notwaita Dracula

```bash
npx cbmp -d "svg" -o "bitmaas/Notwaita-Dracula" -bc "#282a36" -oc "#f8f8f2"
ctgen build.toml -d "bitmaps/Notwaita-Dracula" -n "Notwaita-Dracula" -c "Dracula Notwaita cursors."
```

## Testing Cursor

There are several websites that allow you to test your cursor states by hovering over buttons. This can be very useful when developing or verifying the behavior of a cursor. The following websites cover many of the most commonly used cursors, although they may not include all available options.

-   [Cursor-Test](https://vibhorjaiswal.github.io/Cursor-Test/)
-   [Mozilla CSS Cursor](https://developer.mozilla.org/en-US/docs/Web/CSS/cursor)

For a blueprint for creating XCursors, you may also want to refer to [Cursor-demo](https://wiki.tcl-lang.org/page/Cursor+demo).

## Credit

[Notwaita Cursor Theme](https://gitlab.com/donut2/notwaita-cursor-theme) ·
[Adwaita](https://github.com/GNOME/adwaita-icon-theme) ·
[Dmz](https://github.com/GalliumOS/dmz-cursor-theme) ·
[Yaru](https://github.com/ubuntu/yaru)
