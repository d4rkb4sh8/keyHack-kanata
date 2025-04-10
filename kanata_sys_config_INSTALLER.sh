#!/usr/bin/env bash

# Check if kanata is installed
kanata_path=$(which kanata)
if [ -z "$kanata_path" ]; then
    echo "Error: kanata is not installed or not in PATH. Please install kanata first."
    exit 1
fi

# Create uinput group if not exists
if ! getent group uinput >/dev/null; then
    sudo groupadd uinput
fi

# Add user to input and uinput groups
sudo usermod -aG input,uinput $USER
echo "User $USER added to input and uinput groups. Log out and back in for changes to take effect."

# Configure udev rules
echo 'KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"' | sudo tee /etc/udev/rules.d/99-input.rules >/dev/null
sudo udevadm control --reload-rules && sudo udevadm trigger
echo "Udev rules configured. Permissions for /dev/uinput:"
ls -l /dev/uinput

# Load uinput module
sudo modprobe uinput

# Detect init system and set up service
if systemctl --version &>/dev/null; then
    # Systemd setup
    mkdir -p ~/.config/systemd/user
    config_path="$HOME/.config/kanata/kanata.kbd"
    
    cat <<EOF > ~/.config/systemd/user/kanata.service
[Unit]
Description=Kanata keyboard remapper
Documentation=https://github.com/jtroo/kanata

[Service]
Environment=PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin
Environment=DISPLAY=:0
Type=simple
ExecStart=$kanata_path --cfg $config_path
Restart=no

[Install]
WantedBy=default.target
EOF

    systemctl --user daemon-reload
    systemctl --user enable kanata.service
    systemctl --user start kanata.service
    echo "Kanata systemd service installed. Check status with: systemctl --user status kanata.service"

# elif rc-status &>/dev/null; then
#     # OpenRC setup
#     config_path="$HOME/.config/kanata/kanata.kbd"
#     sudo bash -c "cat <<EOF > /etc/init.d/kanata
# #!/sbin/openrc-run
#
# command=\"$kanata_path\"
# command_args=\"--cfg $config_path\"
#
# command_background=true
# pidfile=\"/run/\${RC_SVCNAME}.pid\"
#
# command_user=\"$USER\"
# EOF"
#
#     sudo chmod +x /etc/init.d/kanata
#     sudo rc-service kanata start
#     sudo rc-update add kanata default
#     echo "Kanata OpenRC service installed and enabled."
#
# else
#     echo "Error: Unsupported init system. Cannot configure startup service."
#     exit 1
# fi

echo "Installation complete. Please log out and back in for group changes to apply."
```
