# ===========================================================
# ---------------------Look and Feel-------------------------
# ===========================================================

# ---------------------Color Scheme--------------------------

# Laputa color scheme
# colorscheme = {
    # 'color1':  '#1e1f21', # dark background color
    # 'color2':  '#282a2e', # slightly lighter color
    # 'color3':  '#373b41', # even slightly lighter
    # 'color4':  '#444950', # even lighter
    # 'color5':  '#707880', # even lighter
    # 'color6':  '#e5e9f0', # white
    # 'color7':  '#4dce51', # green
    # 'color8':  '#4ad28f', # light green
    # 'color9':  '#39a26e', # dark version of the light green
    # 'color10':  '#24a2dc', # blue
    # 'color11':  '#1a76a1', # dark blue
    # 'color12':  '#7f6ad8', # purple
    # 'color13':  '#6554ac', # dark purple
    # 'color14':  '#56c5d4', # other blue
    # 'color15':  '#a3be8c',
    # 'color16':  '#b48ead',
# }

# Tokyonight color scheme#232433
colorscheme = {
    'color1': '#2A2426', # background
    'color2': '#2A2426', # background-dif
    'color3': '#444444', # background-alt
    'color4': '#e6d6ac', # foreground
    'color5': '#e68183', # red
    'color6': '#87af87', # green
    'color7': '#d9bb80', # yellow
    'color8': '#89beba', # blue
    'color9': '#d3a0bc', # purple
    'color10': '#87c095', # cyan
}

# Background color of the completion widget category headers. Headings in the o menu
c.colors.completion.category.bg = colorscheme['color1']
# Bottom border color of the completion widget category headers.
c.colors.completion.category.border.bottom = colorscheme['color3']
# Top border color of the completion widget category headers.
c.colors.completion.category.border.top = colorscheme['color3']
# Foreground color of completion widget category headers.
c.colors.completion.category.fg = colorscheme['color8']

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
c.colors.completion.fg = [colorscheme['color4'], colorscheme['color4'], colorscheme['color4']]
# Background color of the completion widget for even rows.
c.colors.completion.even.bg = colorscheme['color1']
# Background color of the completion widget for odd rows.
c.colors.completion.odd.bg = colorscheme['color2']

# Background color of the selected completion item.
c.colors.completion.item.selected.bg = colorscheme['color6']
# Bottom border color of the selected completion item.
c.colors.completion.item.selected.border.bottom = colorscheme['color6']
# Top border color of the selected completion item.
c.colors.completion.item.selected.border.top = colorscheme['color6']
# Foreground color of the selected completion item.
c.colors.completion.item.selected.fg = colorscheme['color2']
# Foreground color of the matched text in the selected completion item.
c.colors.completion.item.selected.match.fg = colorscheme['color9']

# Foreground color of the matched text in the completion.
c.colors.completion.match.fg = colorscheme['color9']
# Color of the scrollbar in the completion view.
c.colors.completion.scrollbar.bg = colorscheme['color1']
# Color of the scrollbar handle in the completion view.
c.colors.completion.scrollbar.fg = colorscheme['color4']

## Background color of disabled items in the context menu. If set to
## null, the Qt default is used.
# c.colors.contextmenu.disabled.bg = None

## Foreground color of disabled items in the context menu. If set to
## null, the Qt default is used.
# c.colors.contextmenu.disabled.fg = None

## Background color of the context menu. If set to null, the Qt default
## is used.
# c.colors.contextmenu.menu.bg = None

## Foreground color of the context menu. If set to null, the Qt default
## is used.
# c.colors.contextmenu.menu.fg = None

## Background color of the context menu's selected item. If set to null,
## the Qt default is used.
# c.colors.contextmenu.selected.bg = None

## Foreground color of the context menu's selected item. If set to null,
## the Qt default is used.
# c.colors.contextmenu.selected.fg = None


# Background color for the download bar.
c.colors.downloads.bar.bg = colorscheme['color1']
# Background color for downloads with errors.
c.colors.downloads.error.bg = colorscheme['color5']
# Foreground color for downloads with errors.
c.colors.downloads.error.fg = colorscheme['color4']
# Color gradient start for download backgrounds.
c.colors.downloads.start.bg = colorscheme['color9']
# Color gradient start for download text.
c.colors.downloads.start.fg = colorscheme['color1']
# Color gradient stop for download backgrounds.
c.colors.downloads.stop.bg = colorscheme['color10']
# Color gradient end for download text.
c.colors.downloads.stop.fg = colorscheme['color1']
## Color gradient interpolation system for download backgrounds.
## Type: ColorSystem
## Valid values:
##   - rgb: Interpolate in the RGB color system.
##   - hsv: Interpolate in the HSV color system.
##   - hsl: Interpolate in the HSL color system.
##   - none: Don't show a gradient.
# c.colors.downloads.system.bg = 'rgb'
## Color gradient interpolation system for download text.
## Type: ColorSystem
## Valid values:
##   - rgb: Interpolate in the RGB color system.
##   - hsv: Interpolate in the HSV color system.
##   - hsl: Interpolate in the HSL color system.
##   - none: Don't show a gradient.
# c.colors.downloads.system.fg = 'rgb'

# Background color for hints. Note that you can use a `rgba(...)` value for transparency.
c.colors.hints.bg = colorscheme['color1']
# Font color for hints.
c.colors.hints.fg = colorscheme['color8']
# Font color for the matched part of hints.
c.colors.hints.match.fg = colorscheme['color9']

# Background color of the keyhint widget.
c.colors.keyhint.bg = 'rgba(30, 31, 33, 80%)'
# Text color for the keyhint widget.
c.colors.keyhint.fg = colorscheme['color4']
# Highlight color for keys to complete the current keychain.
c.colors.keyhint.suffix.fg = colorscheme['color9']

## Background color of an error message.
# c.colors.messages.error.bg = 'red'
## Border color of an error message.
c.colors.messages.error.border = colorscheme['color5']
## Foreground color of an error message.
# c.colors.messages.error.fg = 'white'

## Background color of an info message.
# c.colors.messages.info.bg = 'black'
## Border color of an info message.
c.colors.messages.info.border = colorscheme['color2']
## Foreground color of an info message.
# c.colors.messages.info.fg = 'white'

## Background color of a warning message.
# c.colors.messages.warning.bg = 'darkorange'
## Border color of a warning message.
c.colors.messages.warning.border = colorscheme['color7']
## Foreground color of a warning message.
# c.colors.messages.warning.fg = 'white'

# Background color for prompts.
c.colors.prompts.bg = colorscheme['color1']
# Border used around UI elements in prompts.
c.colors.prompts.border = '1px solid #444950'
# Foreground color for prompts.
c.colors.prompts.fg = colorscheme['color4']
# Background color for the selected item in filename prompts.
c.colors.prompts.selected.bg = colorscheme['color6']

# Background color of the statusbar in caret mode.
c.colors.statusbar.caret.bg = colorscheme['color9']
# Foreground color of the statusbar in caret mode.
c.colors.statusbar.caret.fg = colorscheme['color4']
# Background color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.bg = colorscheme['color9']
# Foreground color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.fg = colorscheme['color4']

# Background color of the statusbar in command mode.
c.colors.statusbar.command.bg = colorscheme['color1']
# Foreground color of the statusbar in command mode.
c.colors.statusbar.command.fg = colorscheme['color4']

# Background color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.bg = colorscheme['color3']
# Foreground color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.fg = colorscheme['color4']

# Background color of the statusbar in insert mode.
c.colors.statusbar.insert.bg = colorscheme['color6']
# Foreground color of the statusbar in insert mode.
c.colors.statusbar.insert.fg = colorscheme['color1']

# Background color of the statusbar.
c.colors.statusbar.normal.bg = colorscheme['color1']
# Foreground color of the statusbar.
c.colors.statusbar.normal.fg = colorscheme['color4']

# Background color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.bg = colorscheme['color8']
# Foreground color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.fg = colorscheme['color4']

# Background color of the statusbar in private browsing mode.
c.colors.statusbar.private.bg = colorscheme['color3']
# Foreground color of the statusbar in private browsing mode.
c.colors.statusbar.private.fg = colorscheme['color4']

# Background color of the progress bar.
c.colors.statusbar.progress.bg = colorscheme['color4']

## Foreground color of the URL in the statusbar on error.
c.colors.statusbar.url.error.fg = colorscheme['color7']

# Default foreground color of the URL in the statusbar.
c.colors.statusbar.url.fg = colorscheme['color4']
# Foreground color of the URL in the statusbar for hovered links.
c.colors.statusbar.url.hover.fg = colorscheme['color10']

# Foreground color of the URL in the statusbar on successful load (http).
c.colors.statusbar.url.success.http.fg = colorscheme['color4']
# Foreground color of the URL in the statusbar on successful load (https).
c.colors.statusbar.url.success.https.fg = colorscheme['color6']
# Foreground color of the URL in the statusbar when there's a warning.
c.colors.statusbar.url.warn.fg = 'yellow'

# Background color of the tab bar.
c.colors.tabs.bar.bg = colorscheme['color1']
# Background color of unselected even tabs.
c.colors.tabs.even.bg = colorscheme['color1']
# Foreground color of unselected even tabs.
c.colors.tabs.even.fg = colorscheme['color4']
# Background color of unselected odd tabs.
c.colors.tabs.odd.bg = colorscheme['color1']
# Foreground color of unselected odd tabs.
c.colors.tabs.odd.fg = colorscheme['color4']
# Background color of selected even tabs.
c.colors.tabs.selected.even.bg = colorscheme['color8']
# Foreground color of selected even tabs.
c.colors.tabs.selected.even.fg = colorscheme['color1']
# Background color of selected odd tabs.
c.colors.tabs.selected.odd.bg = colorscheme['color8']
# Foreground color of selected odd tabs.
c.colors.tabs.selected.odd.fg = colorscheme['color1']

# Background color of pinned unselected even tabs.
c.colors.tabs.pinned.even.bg = colorscheme['color1']
# Foreground color of pinned unselected even tabs.
c.colors.tabs.pinned.even.fg = colorscheme['color4']
# Background color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.bg = colorscheme['color1']
# Foreground color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.fg = colorscheme['color4']
# Background color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.bg = colorscheme['color8']
# Foreground color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.fg = colorscheme['color1']
# Background color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.bg = colorscheme['color8']
# Foreground color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.fg = colorscheme['color1']

# Color for the tab indicator on errors.
c.colors.tabs.indicator.error = colorscheme['color9']
# Color gradient start for the tab indicator.
c.colors.tabs.indicator.start = colorscheme['color9']
# Color gradient end for the tab indicator.
c.colors.tabs.indicator.stop = colorscheme['color9']
## Color gradient interpolation system for the tab indicator.
## Type: ColorSystem
## Valid values:
##   - rgb: Interpolate in the RGB color system.
##   - hsv: Interpolate in the HSV color system.
##   - hsl: Interpolate in the HSL color system.
##   - none: Don't show a gradient.
# c.colors.tabs.indicator.system = 'rgb'

## Background color for webpages if unset (or empty to use the theme's
## color).
## Type: QtColor
# c.colors.webpage.bg = 'white'

# -----------------------Dark mode--------------------------

## Render all web contents using a dark theme. Example configurations
## from Chromium's `chrome://flags`:  - "With simple HSL/CIELAB/RGB-based
## inversion": Set   `colors.webpage.darkmode.algorithm` accordingly.  -
## "With selective image inversion": Set
## `colors.webpage.darkmode.policy.images` to `smart`.  - "With selective
## inversion of non-image elements": Set
## `colors.webpage.darkmode.threshold.text` to 150 and
## `colors.webpage.darkmode.threshold.background` to 205.  - "With
## selective inversion of everything": Combines the two variants   above.
## Type: Bool
c.colors.webpage.darkmode.enabled = False

## Which algorithm to use for modifying how colors are rendered with
## darkmode.
## Type: String
## Valid values:
##   - lightness-cielab: Modify colors by converting them to CIELAB color space and inverting the L value.
##   - lightness-hsl: Modify colors by converting them to the HSL color space and inverting the lightness (i.e. the "L" in HSL).
##   - brightness-rgb: Modify colors by subtracting each of r, g, and b from their maximum value.
# c.colors.webpage.darkmode.algorithm = 'lightness-cielab'

## Contrast for dark mode. This only has an effect when
## `colors.webpage.darkmode.algorithm` is set to `lightness-hsl` or
## `brightness-rgb`.
## Type: Float
# c.colors.webpage.darkmode.contrast = 0.0

## Render all web contents using a dark theme. Example configurations
## from Chromium's `chrome://flags`:  - "With simple HSL/CIELAB/RGB-based
## inversion": Set   `colors.webpage.darkmode.algorithm` accordingly.  -
## "With selective image inversion": Set
## `colors.webpage.darkmode.policy.images` to `smart`.  - "With selective
## inversion of non-image elements": Set
## `colors.webpage.darkmode.threshold.text` to 150 and
## `colors.webpage.darkmode.threshold.background` to 205.  - "With
## selective inversion of everything": Combines the two variants   above.
## Type: Bool
# c.colors.webpage.darkmode.enabled = False

## Render all colors as grayscale. This only has an effect when
## `colors.webpage.darkmode.algorithm` is set to `lightness-hsl` or
## `brightness-rgb`.
## Type: Bool
# c.colors.webpage.darkmode.grayscale.all = False

## Desaturation factor for images in dark mode. If set to 0, images are
## left as-is. If set to 1, images are completely grayscale. Values
## between 0 and 1 desaturate the colors accordingly.
## Type: Float
# c.colors.webpage.darkmode.grayscale.images = 0.0

## Which images to apply dark mode to. WARNING: With QtWebengine 5.15.0,
## this setting can cause frequent renderer process crashes due to a
## https://codereview.qt-project.org/c/qt/qtwebengine-
## chromium/+/304211[bug in Qt]. Thus, the 'smart' setting is ignored and
## treated like 'never' in that case.
## Type: String
## Valid values:
##   - always: Apply dark mode filter to all images.
##   - never: Never apply dark mode filter to any images.
##   - smart: Apply dark mode based on image content.
# c.colors.webpage.darkmode.policy.images = 'never'

## Which pages to apply dark mode to.
## Type: String
## Valid values:
##   - always: Apply dark mode filter to all frames, regardless of content.
##   - smart: Apply dark mode filter to frames based on background color.
# c.colors.webpage.darkmode.policy.page = 'smart'

## Threshold for inverting background elements with dark mode. Background
## elements with brightness above this threshold will be inverted, and
## below it will be left as in the original, non-dark-mode page. Set to
## 256 to never invert the color or to 0 to always invert it. Note: This
## behavior is the opposite of `colors.webpage.darkmode.threshold.text`!
## Type: Int
# c.colors.webpage.darkmode.threshold.background = 0

## Threshold for inverting text with dark mode. Text colors with
## brightness below this threshold will be inverted, and above it will be
## left as in the original, non-dark-mode page. Set to 256 to always
## invert text color or to 0 to never invert text color.
## Type: Int
# c.colors.webpage.darkmode.threshold.text = 256

## Force `prefers-color-scheme: dark` colors for websites.
## Type: Bool
# c.colors.webpage.prefers_color_scheme_dark = False


# ------------------------Fonts-----------------------------

# Default font families to use. Whenever "default_family" is used.
c.fonts.default_family = ['cozette']

# Default font size to use. Whenever "default_size" is used.
# A float value with a "pt" suffix, or an integer value with a "px" suffix.
c.fonts.default_size = '12px'

## Default monospace fonts. Whenever "monospace" is used in a font
## setting, it's replaced with the fonts listed here.
# c.fonts.monospace = '"xos4 Terminus", Terminus, Monospace, "DejaVu Sans Mono", Monaco, "Bitstream Vera Sans Mono", "Andale Mono", "Courier New", Courier, "Liberation Mono", monospace, Fixed, Consolas, Terminal'
# c.fonts.monospace = "cozette"

## Font family for cursive fonts.
# c.fonts.web.family.cursive = ''
## Font family for fantasy fonts.
# c.fonts.web.family.fantasy = ''
## Font family for fixed fonts.
# c.fonts.web.family.fixed = ''
## Font family for sans-serif fonts.
# c.fonts.web.family.sans_serif = ''
## Font family for serif fonts.
# c.fonts.web.family.serif = ''
## Font family for standard fonts.
# c.fonts.web.family.standard = ''

## Font used in the completion categories.
# c.fonts.completion.category = 'bold 10pt monospace'

## Font used in the completion widget.
# c.fonts.completion.entry = '10pt monospace'

## Font used for the debugging console.
# c.fonts.debug_console = '10pt monospace'

## Font used for the downloadbar.
# c.fonts.downloads = '10pt monospace'

## Font used for the hints.
# c.fonts.hints = 'bold 10pt monospace'

## Font used in the keyhint widget.
# c.fonts.keyhint = '10pt monospace'

## Font used for error messages.
# c.fonts.messages.error = '10pt monospace'

## Font used for info messages.
# c.fonts.messages.info = '10pt monospace'

## Font used for warning messages.
# c.fonts.messages.warning = '10pt monospace'

## Font used for prompts.
# c.fonts.prompts = '10pt sans-serif'

## Font used in the statusbar.
# c.fonts.statusbar = '10pt monospace'

## Font used in the tab bar.
# c.fonts.tabs = '10pt monospace'

## Default font size (in pixels) for regular text.
# c.fonts.web.size.default = 16
## Default font size (in pixels) for fixed-pitch text.
# c.fonts.web.size.default_fixed = 13
## Hard minimum font size (in pixels).
# c.fonts.web.size.minimum = 0
## Minimum logical font size (in pixels) that is applied when zooming
## out.
# c.fonts.web.size.minimum_logical = 6

# ---------------------Ui Options---------------------------

## CSS border value for hints.
## Type: String
c.hints.border = '1px solid #444950'

## Padding (in pixels) for the statusbar.
## Type: Padding
c.statusbar.padding = {'top': 5, 'bottom': 5, 'left': 0, 'right': 0}

## Padding (in pixels) around text for tabs.
## Type: Padding
c.tabs.padding = {'top': 5, 'bottom': 5, 'left': 5, 'right': 5}

# Position of the status bar.
# Type: VerticalPosition
# Valid values:
#   - top
#   - bottom
c.statusbar.position = 'bottom'

# When to show the statusbar.
# Type: String
# Valid values:
#   - always: Always show the statusbar.
#   - never: Always hide the statusbar.
#   - in-mode: Show the statusbar when in modes other than normal mode.
c.statusbar.show = 'in-mode'

# ---------------------User stylesheets---------------------

## List of user stylesheet filenames to use.
## Type: List of File, or File
# c.content.user_stylesheets = []

# ==========================================================
# -----------------------Security---------------------------
# ==========================================================

## Enable JavaScript.
## Type: Bool
# c.content.javascript.enabled = True

## Enable the ad/host blocker
## Type: Bool
c.content.blocking.enabled = True

## Which method of blocking ads should be used.  Support for Adblock Plus
## (ABP) syntax blocklists using Brave's Rust library requires the
## `adblock` Python package to be installed, which is an optional
## dependency of qutebrowser. It is required when either `adblock` or
## `both` are selected.
## Type: String
## Valid values:
##   - auto: Use Brave's ABP-style adblocker if available, host blocking otherwise
##   - adblock: Use Brave's ABP-style adblocker
##   - hosts: Use hosts blocking
##   - both: Use both hosts blocking and Brave's ABP-style adblocker
c.content.blocking.method = 'both'

## Allow websites to record audio/video.
## Type: BoolAsk
## Valid values:
##   - true
##   - false
##   - ask
# c.content.media_capture = 'ask'

## Open new windows in private browsing mode which does not record
## visited pages.
## Type: Bool
# c.content.private_browsing = False

## Allow websites to read canvas elements. Note this is needed for some
## websites to work properly.
## Type: Bool
c.content.canvas_reading = False

## User agent to send.  The following placeholders are defined:  *
## `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
## The underlying WebKit version (set to a fixed value   with
## QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
## QtWebEngine. * `{qt_version}`: The underlying Qt version. *
## `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
## QtWebEngine. * `{upstream_browser_version}`: The corresponding
## Safari/Chrome version. * `{qutebrowser_version}`: The currently
## running qutebrowser version.  The default value is equal to the
## unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
## read from JavaScript is always the global value. With QtWebEngine
## between 5.12 and 5.14 (inclusive), changing the value exposed to
## JavaScript requires a restart.
## Type: FormatString
# c.content.headers.user_agent = 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {qt_key}/{qt_version} {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}'

## Value to send in the `Accept-Language` header. Note that the value
## read from JavaScript is always the global value.
## Type: String
# c.content.headers.accept_language = 'en-US,en' # change this

## Custom headers for qutebrowser HTTP requests.
## Type: Dict
# c.content.headers.custom = {"accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}

## Enable WebGL.
## Type: Bool
# c.content.webgl = False

## Which cookies to accept. With QtWebEngine, this setting also controls
## other features with tracking capabilities similar to those of cookies;
## including IndexedDB, DOM storage, filesystem API, service workers, and
## AppCache. Note that with QtWebKit, only `all` and `never` are
## supported as per-domain values. Setting `no-3rdparty` or `no-
## unknown-3rdparty` per-domain on QtWebKit will have the same effect as
## `all`. If this setting is used with URL patterns, the pattern gets
## applied to the origin/first party URL of the page making the request,
## not the request URL.
## Type: String
## Valid values:
##   - all: Accept all cookies.
##   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
##   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
##   - never: Don't accept cookies at all.
# c.content.cookies.accept = 'all'

## Store cookies. Note this option needs a restart with QtWebEngine on Qt
## < 5.9.
## Type: Bool
# c.content.cookies.store = True

# ==========================================================
# ---------------------functionality------------------------
# ==========================================================

## This is here so configs done via the GUI are still loaded.
## Remove it to not load settings done via the GUI.
config.load_autoconfig(False)

# Time interval (in milliseconds) between auto-saves of
# config/cookies/etc.
c.auto_save.interval = 15000

# Always restore open sites when qutebrowser is reopened.
c.auto_save.session = True

# Backend webengine choice
c.backend = 'webengine'

## Require a confirmation before quitting the application.
## Type: ConfirmQuit
## Valid values:
##   - always: Always show a confirmation.
##   - multiple-tabs: Show a confirmation if multiple tabs are opened.
##   - downloads: Show a confirmation if downloads are running
##   - never: Never show a confirmation.
c.confirm_quit = ['downloads']

## Automatically start playing `<video>` elements. Note: On Qt < 5.11,
## this option needs a restart and does not support URL patterns.
## Type: Bool
c.content.autoplay = False

## Where to show the downloaded files.
## Type: VerticalPosition
## Valid values:
##   - top
##   - bottom
c.downloads.position = 'bottom'

## Automatically enter insert mode if an editable element is focused
## after loading the page.
## Type: Bool
c.input.insert_mode.auto_load = False

## Leave insert mode when starting a new page load. Patterns may be
## unreliable on this setting, and they may match the url you are
## navigating to, or the URL you are navigating from.
## Type: Bool
c.input.insert_mode.leave_on_load = True

## Position of new tabs opened from another tab. See
## `tabs.new_position.stacking` for controlling stacking behavior.
## Type: NewTabPosition
## Valid values:
##   - prev: Before the current tab.
##   - next: After the current tab.
##   - first: At the beginning.
##   - last: At the end.
c.tabs.new_position.related = 'next'

## Which tab to select when the focused tab is removed.
## Type: SelectOnRemove
## Valid values:
##   - prev: Select the tab which came before the closed one (left in horizontal, above in vertical).
##   - next: Select the tab which came after the closed one (right in horizontal, below in vertical).
##   - last-used: Select the previously selected tab.
c.tabs.select_on_remove = 'last-used'

## When to show the tab bar.
## Type: String
## Valid values:
##   - always: Always show the tab bar.
##   - never: Always hide the tab bar.
##   - multiple: Hide the tab bar if only one tab is open.
##   - switching: Show the tab bar when switching tabs.
c.tabs.show = 'multiple'

## Search engines which can be used via the address bar. Maps a search
## engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
## placeholder. The placeholder will be replaced by the search term, use
## `{{` and `}}` for literal `{`/`}` signs. The search engine named
## `DEFAULT` is used when `url.auto_search` is turned on and something
## else than a URL was entered to be opened. Other search engines can be
## used by prepending the search engine name to the search term, e.g.
## `:open google qutebrowser`.
## Type: Dict
c.url.searchengines = {'DEFAULT': 'https://www.google.com/search?q={}',
        '!d': 'https://duckduckgo.com/?q={}',
        '!y': 'https://www.youtube.com/results?search_query={}',
        '!w': 'https://en.wikipedia.org/wiki/{}',
        '!b': 'https://bakabt.me/browse.php?q={}',
        '!i': 'https://duckduckgo.com/?q={}&t=h_&iar=images&iax=images&ia=images',
        '!e': 'https://exhentai.org/?f_search={}',
        '!n': 'https://nhentai.net/search/?q={}',
        '!m': 'https://mangadex.cc/search?title={}',
        '!4': 'http://boards.4channel.org/{}/catalog'}

## Page(s) to open at the start.
## Type: List of FuzzyUrl, or FuzzyUrl
c.url.start_pages = ['~/Documents/Notes/Websites/Homepage/Version_2/Startpage.html']

config.bind('K', 'tab-next')
config.bind('J', 'tab-prev')
config.bind('j', 'scroll-px 0 30')
config.bind('k', 'scroll-px 0 -30')

#open videos in mpv
config.bind(',v', 'hint links spawn umpv "{hint-url}"')

#youtube-dl keybinds
config.bind(',yv', 'hint links spawn youtube-dl -o "~/Video/Web/Youtube/%(uploader)s/%(title)s.%(ext)s" {hint-url}')
config.bind(',ya', 'hint links spawn youtube-dl -x --audio-format mp3 --embed-thumbnail -o "~/Audio/Web/Youtube/%(uploader)s/%(title)s.%(ext)s" {hint-url}')

#autofill bitwarden password
config.bind(',p', 'spawn --userscript qute-bitwarden -d "dmenu -p Choice -l 5"')

#reverse image searching
config.bind(',ry', 'hint images run :open -t https://yandex.com/images/search?source=collections&rpt=imageview&url={hint-url}')
config.bind(',rs', 'hint images run :open -t http://saucenao.com/search.php?url={hint-url}')
config.bind(',ri', 'hint images run :open -t http://iqdb.org/?url={hint-url}')
config.bind(',rt', 'hint images run :open -t http://tineye.com/search?url={hint-url}')

#download to a specific folder
config.bind(',dp', 'hint images run :download --dest "~/Pictures/ {hint-url}')
config.bind(',dt', 'hint links run :download --dest "~/.cache/rtorrent/watch/ {hint-url}')

#opens all of the manga sites i check for updates, ;; signifies start a new command
config.bind(',om', 'open -t https://leviatanscans.com/home ;;open -t https://jaiminisbox.com/ ;;open -t https://www.hatigarmscans.net/ ;;open -t https://www.mangaruru.ml/ ;;open -t https://www.viz.com/shonenjump/chapters/act-age ;;open -t https://ptscans.com/')
