A patched version of xterm to yank URLs by keyboard.

Original: https://bbs.archlinux.org/viewtopic.php?id=181515

Simplified and bugfixed for mutt by me.

## Installation

```
makepkg -i
```

## Usage

**~/.Xresources**

```Xdefaults
xterm*charClass: 33:48,37-38:48,45-47:48,64:48,58:48,126:48,61:48,63:48,43:48,35:48

*VT100.Translations: #override \n\
        Alt <Key>u: select-needle("://") select-set(PRIMARY) \n\
        Alt <Key>o: exec-formatted("chromium '%t'", PRIMARY) select-start() select-end()
```
