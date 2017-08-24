#!/bin/sh

mkinit="/etc/mkinitcpio.conf"
radeon="/etc/mkinitcpio.conf.radeon"
vfio="/etc/mkinitcpio.conf.vfio"
conf="/etc/X11/xorg.conf.d/"

cd /etc/

if diff "$mkinit" "$vfio" >/dev/null ;
then
    cp ""$radeon "$mkinit"
    echo "$radeon is now active, backed up $vfio"
    mv $conf/10-intel.conf $conf/20-intel.conf
    mv $conf/20-radeon.conf $conf/10-radeon.conf

elif diff "$mkinit" "$radeon" >/dev/null ;
then
    cp "$vfio" "$mkinit"
    echo "$vfio is now active, backed up $radeon" 
    mv $conf/20-intel.conf $conf/10-intel.conf
    mv $conf/10-radeon.conf $conf/20-radeon.conf
else
    echo "There's no mkinit"
fi

sudo mkinitcpio -p linux
