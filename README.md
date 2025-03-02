## What

This is a set of Nix expressions to evaluate a NixOS configuration that contains KDE Plasma, its common dependencies, and associated configuration as would exist on a modern Linux system.

The goal is to run a (Wayland) user session using the software in this environment from an Ubuntu LTS 22.04 system without User Namespaces, chroots, setuid helpers or other isolation/elevation. Putting symlinks in /usr/local was the only concession I was willing to make. Other user accounts shouldn't suddenly be calling binaries from this experiment however (e.g. it's fine to put a symlink targeting a binary in /usr/bin in /usr/local/bin as that's a no-op for other accounts).

As a "fun" extra complication the target system has Nvidia Optimus with displays connected on both GPUs. I only modeset and use displays on the Nvidia framebuffer and would prefer acceleration to happen on that GPU.

The host system does not have KDE Plasma installed but does have QT from the Ubuntu repos.

## Why

I didn't want to compile the entire KDE suite in a prefix and integrate it with the libraries that come with Ubuntu 22.04 and I was morbidly curious how terrible a chimera like this would be.

I didn't want to use user namespaces because the host system has many SSSD network UIDs/GIDs and when using a user namespace it is hard to integrate with them.

## How

## Does it work?

Surprisingly, yes but with many quirks.

Ubuntu's GDM can start an accelerated Wayland Plasma session from the Nix store with XWayland support compositing to displays connected to the NVIDIA GPU via the proprietary NVIDIA drivers.

Plasma (or possibly the NixOS user config) does want to use some features from a Systemd newer than the 257 that comes with Ubuntu 22.04 but they only seemed to result in warnings.

Using DBus from the Ubuntu host worked initially but there were quirks (e.g. inability to use dbus to launch apps when certain packages were installed) solved by forcing systemd to start the Nixpkgs version and configuration of DBus (user bus, not the system bus) instead.

Anything that was built for Nixpkgs seemed to work fine with the exception of any applications that relied on setuid/setgid/capabilities. For example, the XDG Portals attempt to use FUSE binaries from Nix store and thus will fail to load. I believe NixOS uses wrappers generated at runtime for this functionality and I didn't replicate that feature.

Applications using the system linker/libraries (rather then the Nix store) seemed to work as long as they were targeting X11/XWayland. This included the Firefox Snap and applications such as Google Chrome. Google Chrome via XWayland could only enumerate and use the Intel GPU for acceleration even though on a normal XOrg session it could see both GPUs. Vulkan and GLES applications using the Nix store libraries could render on either GPU, so I'm unsure if the problem was XWayland itself or some system library that Chrome was using.

However, applications that used the system libraries and were (re-)configured to use Wayland did not function and could cause the entire session to freeze (in particular, Google Chrome).

Even using a Nixpkgs wrapped Google Chrome did not work as for some reason Chrome wanted to load broken Ubuntu QT5 Wayland libaries. QT5 wasn't on the NixPkg generated LD_LIBRARY_PATH. This is likely further complicated by the environment causing QT5 to load mismatched QML and plugins.
