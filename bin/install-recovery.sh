#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:8462336:cf19aa82e6f70bd722beadcded410c34ca191cae; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:7897088:f8ee88722a8a0538f27b6e5e4afd34ff58174dda EMMC:/dev/block/bootdevice/by-name/recovery cf19aa82e6f70bd722beadcded410c34ca191cae 8462336 f8ee88722a8a0538f27b6e5e4afd34ff58174dda:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
