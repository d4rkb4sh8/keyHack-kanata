# keyHack-kanata 

### Philosophy

- Keep keyboard use simple and focused around the home row - so when one hand triggers a layer or an action the other triggers a shortcut
- Incorporate VIM - arrow movements
- Incorporate useful editing features 
- Incorporate Terminal shortcuts
- many options have been set to do a secondary action if the key is held down.
- Switching between the layers the corresponding layer button only needs to be held.

**There are 5 layers in all.**

### Layer 1 - Main use

- caps and esc key swapped
- f1-f12 - control quake terminal dropdown, brightness, volume, screenshots, and swapping desktops left and right
- Home Row Mods (reflective) - Shift, Meta, Alt, Ctrl and simply reflected on the right hand side Ctrl, Alt, Meta Shift
- bspc/Del key to the left of the space bar 
- return/Alt-grub key to the right of the space bar
- Useful shortcuts for deleting a word  left/right
    

&nbsp;

### Layer 2 - Navigation with text in the the terminal

With L2 held on your left hand

- Access useful terminal shortcuts and also use combination keys
- VIM HJKL used to control arrow movement when moving the cursor
- VIM - go to the beginning of the line with n when held equivalent of hitting 0
- VIM - got to the end of the line with m when held equivalent of hitting $
- Useful shortcuts for deleting a word from the terminal left/right
- delete the line before/after the cursor in the terminal
- Select all, undo, cut, copy and paste

&nbsp;

### Layer 3 - Symbols layer

with L3 held on your right hand

- access all the SYMBOLS needed with your left hand
&nbsp;

## Installation

[](#)[](#installation)

- To get keyHack, check out this repository with Git 
- Launch `kanata.kbd` with Kanata.
    - You can install Kanata by downloading a [pre-built executable](https://github.com/jtroo/kanata/releases).
    - Follow the installation details of your operating system.

Windows

Windows users might prefer to download the `kanata_winIOv2.exe` version as it fixes some weird bugs like C and V inversion.

*Note: This tip has been tested for version 1.6.1 of Kanata. In later versions the `winIOv2` version might be the default.*

Put the `kanata_winIOv2.exe` in the Kanata Arsenik folder, run it and you’re good to go!

Linux

### Run Kanata without `sudo`

[](#)[](#run-kanata-without-sudo)

kanata needs to intercept `uinput` signals, which it cannot do without the proper authorisations.

If you don’t want to run `kanata` with `sudo`, you’ll need to allow Kanata to read from `uinput`. This requires the users to be part of both `input` and `uinput` groups.

For that, you first need to create a `uinput` group if it doesn’t exist yet:

```shell
sudo groupadd -U $USERNAME uinput
```

where `$USERNAME` is the target user (or users in a comma-separated list). Then add the target user (or users) to the group input:

```shell
sudo usermod -aG input $USERNAME
```

You can check after re-logging that both groups appear in the result of the `groups` command launched as the target user.

Finally, you need to add a udev rule in `/etc/udev/rules.d/50-kanata.rules`:

```
KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
```

### Making a user-side `systemd` service for Kanata

[](#)[](#making-a-user-side-systemd-service-for-kanata)

Note: This only works if `kanata` is able to run without `sudo` (and is using `systemd`).

Using a `systemd service` allows running `kanata` as a daemon, possibly right after logging in. Here is a template for a service file:

```
[Unit]
Description=Kanata keyboard remapper
Documentation=https://github.com/jtroo/kanata

[Service]
Environment=PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin
Environment=DISPLAY=:0
Environment=HOME=/path/to/home/folder
Type=simple
ExecStart=/usr/local/bin/kanata --cfg /path/to/kanata/config/file
Restart=no

[Install]
WantedBy=default.target
```

Copy-paste it into `~/.config/systemd/user/kanata.service`, fill in the placeholders, then run one of the following commands:

- `systemctl --user start kanata.service` to manually start `kanata`
- `systemctl --user enable kanata.service` so `kanata` may autostart whenever the current user logs in
- `systemctl --user status kanata.service` to check if `kanata` is running

 macOS

### Karabiner DriverKit installation

[](#)[](#karabiner-driverkit-installation)

Install the [Karabiner-DriverKit-VirtualHIDDevice](https://github.com/pqrs-org/Karabiner-DriverKit-VirtualHIDDevice/releases/tag/v4.3.0). Latest version (v5.0.0) is not working with Kanata.

To activate it:

```
/Applications/.Karabiner-VirtualHIDDevice-Manager.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Manager activate
```

You may have to allow Kanata execution in the Privacy & Security panel from macOS settings.

As root, add the following content in `/Library/LaunchDaemons/org.pqrs.service.daemon.Karabiner-VirtualHIDDevice-Daemon.plist` file:

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>org.pqrs.service.daemon.Karabiner-VirtualHIDDevice-Daemon</string>
    <key>KeepAlive</key>
    <true/>
    <key>ProcessType</key>
    <string>Interactive</string>
    <key>ProgramArguments</key>
    <array>
      <string>/Library/Application Support/org.pqrs/Karabiner-DriverKit-VirtualHIDDevice/Applications/Karabiner-VirtualHIDDevice-Daemon.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Daemon</string>
    </array>
  </dict>
</plist>
```

A new item *Fumihiko Takayama* will be added in System Settings > Login Items.

Two Karabiner processes should be started:

```
sh-3.2# ps aux | grep -i karabiner | grep -v grep
_driverkit       26050   0.0  0.0 410598064   2256   ??  Ss    8:02PM   0:00.04 /Library/SystemExtensions/.../org.pqrs.Karabiner-DriverKit-VirtualHIDDevice.dext/org.pqrs.Karabiner-DriverKit-VirtualHIDDevice org.pqrs.Karabiner-DriverKit-VirtualHIDDevice 0x10002b929 org.pqrs.Karabiner-DriverKit-VirtualHIDDevice
root             25744   0.0  0.1 410756464   9872   ??  Ss    8:01PM   0:00.16 /Library/Application Support/org.pqrs/Karabiner-DriverKit-VirtualHIDDevice/Applications/Karabiner-VirtualHIDDevice-Daemon.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Daemon
```

### Kanata installation

[](#)[](#kanata-installation)

Download Kanata [here](https://github.com/jtroo/kanata/releases/tag/v1.7.0) and save it in a persistent directory.

Add a sudo rule in `/private/etc/sudoers.d/kanata` where `$USERNAME` is your username:

```
$USERNAME ALL=(ALL) NOPASSWD: /path/to/kanata/binary/kanata
```

To start Kanata at the beginning of the session, add a property list file in `~/Library/LaunchAgents/com.jtroo.kanata.plist` with the following content:

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.jtroo.kanata</string>

    <key>ProgramArguments</key>
    <array>
        <string>sudo</string>
        <string>/path/to/kanata/binary/kanata</string>
        <string>--cfg</string>
        <string>/path/to/kanata/config/file</string>
        <string>-n</string>
    </array>

    <key>RunAtLoad</key>
    <true/>

    <key>KeepAlive</key>
    <true/>
</dict>
</plist>
```

In system settings, search Login Items menu and select `sudo` service in *Allow in the Background* list. You can restart Kanata with new configuration by disabling and enabling this service.

