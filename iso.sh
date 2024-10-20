#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/potatoos.kernel isodir/boot/potatoos.kernel
cat > isodir/boot/grub/grub.cfg << EOF
GRUB_DEFAULT=pos
GRUB_TIMEOUT=5
GRUB_GFXMODE=1440x900
color_normal=black/white
color_highlight=light-gray/black


menuentry "greendogos"  --id pos{
	multiboot /boot/potatoos.kernel
}
EOF
grub-mkrescue -o potatoOS.iso isodir
