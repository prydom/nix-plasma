export __NIXOS_SET_ENVIRONMENT_DONE=1

export GIO_EXTRA_MODULES="/opt/nix-plasma/lib/gio/modules"
export KPACKAGE_DEP_RESOLVERS_PATH="/opt/nix-plasma/libexec/kf6/kpackagehandlers"

export LANG="en_CA.UTF-8"
export LOCALE_ARCHIVE="/opt/nix-plasma/lib/locale/locale-archive"

export NIX_XDG_DESKTOP_PORTAL_DIR="/opt/nix-plasma/share/xdg-desktop-portal/portals"

export QML2_IMPORT_PATH="$HOME/.nix-profile/lib/qt-5.15.16/qml:$HOME/.nix-profile/lib/qt-6/qml:${XDG_STATE_HOME}/nix/profile/lib/qt-5.15.16/qml:${XDG_STATE_HOME}/nix/profile/lib/qt-6/qml:$HOME/.local/state/nix/profile/lib/qt-5.15.16/qml:$HOME/.local/state/nix/profile/lib/qt-6/qml:/etc/profiles/per-user/$USER/lib/qt-5.15.16/qml:/etc/profiles/per-user/$USER/lib/qt-6/qml:/nix/var/nix/profiles/default/lib/qt-5.15.16/qml:/nix/var/nix/profiles/default/lib/qt-6/qml:/opt/nix-plasma/lib/qt-5.15.16/qml:/opt/nix-plasma/lib/qt-6/qml"
export QTWEBKIT_PLUGIN_PATH="$HOME/.nix-profile/lib/mozilla/plugins/:${XDG_STATE_HOME}/nix/profile/lib/mozilla/plugins/:$HOME/.local/state/nix/profile/lib/mozilla/plugins/:/etc/profiles/per-user/$USER/lib/mozilla/plugins/:/nix/var/nix/profiles/default/lib/mozilla/plugins/:/opt/nix-plasma/lib/mozilla/plugins/"
export QT_PLUGIN_PATH="$HOME/.nix-profile/lib/qt-5.15.16/plugins:$HOME/.nix-profile/lib/qt-6/plugins:${XDG_STATE_HOME}/nix/profile/lib/qt-5.15.16/plugins:${XDG_STATE_HOME}/nix/profile/lib/qt-6/plugins:$HOME/.local/state/nix/profile/lib/qt-5.15.16/plugins:$HOME/.local/state/nix/profile/lib/qt-6/plugins:/etc/profiles/per-user/$USER/lib/qt-5.15.16/plugins:/etc/profiles/per-user/$USER/lib/qt-6/plugins:/nix/var/nix/profiles/default/lib/qt-5.15.16/plugins:/nix/var/nix/profiles/default/lib/qt-6/plugins:/opt/nix-plasma/lib/qt-5.15.16/plugins:/opt/nix-plasma/lib/qt-6/plugins"

export SSH_ASKPASS="/opt/nix-plasma/bin/ksshaskpass"
export XCURSOR_PATH="/opt/nix-plasma/share/icons:/opt/nix-plasma/share/pixmaps:/usr/local/share/pixmaps:/usr/share/pixmaps"

export XDG_CONFIG_DIRS="$HOME/.config/kdedefaults:/etc/xdg:$HOME/.nix-profile/etc/xdg:${XDG_STATE_HOME}/nix/profile/etc/xdg:$HOME/.local/state/nix/profile/etc/xdg:/etc/profiles/per-user/$USER/etc/xdg:/nix/var/nix/profiles/default/etc/xdg:/opt/nix-plasma/etc/xdg:/etc/xdg"
export XDG_DATA_DIRS="$HOME/.nix-profile/share:${XDG_STATE_HOME}/nix/profile/share:$HOME/.local/state/nix/profile/share:/etc/profiles/per-user/$USER/share:/nix/var/nix/profiles/default/share:/opt/nix-plasma/share:/usr/local/share:/usr/share"
export LIBEXEC_PATH="$HOME/.nix-profile/libexec:${XDG_STATE_HOME}/nix/profile/libexec:$HOME/.local/state/nix/profile/libexec:/etc/profiles/per-user/$USER/libexec:/nix/var/nix/profiles/default/libexec:/opt/nix-plasma/libexec:/usr/local/libexec:/usr/libexec:/lib64/libexec:/lib/libexec"
export PATH="$HOME/.nix-profile/bin:${XDG_STATE_HOME}/nix/profile/bin:$HOME/.local/state/nix/profile/bin:/etc/profiles/per-user/$USER/bin:/nix/var/nix/profiles/default/bin:/opt/nix-plasma/bin${PATH:+:$PATH}"
