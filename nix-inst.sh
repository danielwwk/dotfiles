parted /dev/vda -- mklabel gpt;\
parted /dev/vda -- mkpart primary 512MiB -8GiB;\
parted /dev/vda -- mkpart primary linux-swap -8GiB 100%;\
parted /dev/vda -- mkpart ESP fat32 1MiB 512MiB;\
parted /dev/vda -- set 3 esp on;\

mkfs.ext4 -L nixos /dev/vda1;\
mkswap -L swap /dev/vda2;\
swapon /dev/sda2;\
mkfs.fat -F 32 -n boot /dev/vda3;\
mount /dev/disk/by-label/nixos /mnt;\
mkdir -p /mnt/boot;\
mount /dev/disk/by-label/boot /mnt/boot;\

nixos-generate-config --root /mnt
#nano /mnt/etc/nixos/configuration.nix
cp tt.nix /mnt/etc/nixos/configuration.nix
nixos-install

#echo mkdir /home/daniel/.config/
reboot
