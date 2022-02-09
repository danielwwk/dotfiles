echo 1. guest
echo ip a (obtain ip)
echo passwd nixos (assign password)

echo 2. host
scp configuration.nix nixos@192.168.122.$1:/home/nixos/tt.nix
scp instn.sh nixos@192.168.122.$1:/home/nixos/tt.sh

echo 3. guest
echo sudo su
echo cp tt.nix /mnt/etc/nixos/configuration.nix
echo nixos-install
echo reboot
echo (tty1)
echo login root
echo passwd daniel
echo sudo su daniel
echo mkdir -p ~/.config/bspwm
echo cp $(sudo find / -name "bspwmrc" | grep "examples/bspwmrc") ~/.config/bspwm/
echo mkdir -p ~/.config/sxhkd
echo cp $(sudo find / -name "sxhkdrc" | grep "examples/sxhkdrc") ~/.config/sxhkd/
echo (tty7)
echo login daniel

