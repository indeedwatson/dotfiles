#!/bin/sh

foo="/etc/mkinitcpio.conf"
foo1="/etc/mkinitcpio.conf.radeon"
foo2="/etc/mkinitcpio.conf.vfio"
conf="/etc/X11/xorg.conf.d/"

cd /etc/

if diff "$foo" "$foo2" >/dev/null ;
then
    cp ""$foo1 "$foo"
    echo "$foo1 is now active, backed up $foo2"
    mv $conf/10-intel.conf $conf/20-intel.conf
    mv $conf/20-radeon.conf $conf/10-radeon.conf

elif diff "$foo" "$foo1" >/dev/null ;
then
    cp "$foo2" "$foo"
    echo "$foo2 is now active, backed up $foo1" 
    mv $conf/20-intel.conf $conf/10-intel.conf
    mv $conf/10-radeon.conf $conf/20-radeon.conf
else
    echo "There's no foo"
fi

sudo mkinitcpio -p linux
