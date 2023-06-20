# Conky config

## Settup
```console
git clone --recursive git@github.com:pedroxs/conky.git "$HOME/.config/conky"
```

## Autostart
```
~/.config/autostart/conky.desktop
---
[Desktop Entry]
Type=Application
Name=conky
Exec=conky --daemonize --pause=5 --display=DISPLAY
StartupNotify=false
Terminal=false
```

Where `DISPLAY` is chosen from inspectin `xrandr --listmonitors`