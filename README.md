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
Exec=conky --daemonize --pause=5
StartupNotify=false
Terminal=false
```