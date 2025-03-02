#!/bin/bash
rm -f /run/opengl-driver
cp --no-dereference build/opengl-driver /run
rm -f /opt/nix-plasma
cp --no-dereference build/nix-plasma /opt
rm -f /home/kde_test/.config/plasma-etc
cp --no-dereference build/etc /home/kde_test/.config/plasma-etc

cp 99-plasma-env.conf ~kde_test/.config/environment.d
chown kde_test:kde_test ~kde_test/.config/environment.d/99-plasma-env.conf

cp user.conf ~kde_test/.config/systemd
chown kde_test:kde_test ~kde_test/.config/systemd/user.conf

# ln -s /opt/nix-plasma/share/xsessions/plasmax11.desktop /usr/local/share/xsessions
# ln -s /opt/nix-plasma/share/wayland-sessions/plasma.desktop /usr/local/share/wayland-sessions

#cp nix.profile ~kde_test/.config
#chown kde_test:kde_test ~kde_test/.config/nix.profile
