#!/system/bin/sh
#
# ----------------------------------------
# TY ShenLei 2014/08/18 Add For USBConfig
# ----------------------------------------

target=`getprop ro.product.device`
cdromname="/system/etc/cdrom_install.iso"
cdromenable=`getprop persist.service.cdrom.enable`
tycharging=`getprop sys.usb.config`

LOG_TAG="ty_cdrom_sh"
LOG_NAME="${0}:"

loge ()
{
  /system/bin/log -t $LOG_TAG -p e "$LOG_NAME $@"
}

loge "target:$target"
loge "cdromname:$cdromname"
loge "cdromenable:$cdromenable"
loge "tycharging:$tycharging"

case "$target" in
        "msm8226" | "msm8610" | "msm8916" | "msm8916_32" | "msm8916_32_512" | "msm8916_64")
                case "$cdromenable" in
                        0)
                                echo "" > /sys/class/android_usb/android0/f_mass_storage/rom/file
                                ;;
                        1)
                                case "$tycharging" in 
                                       "tycharging")
                                                     loge "uninstall cdrom_install.iso"
                                                     echo "" > /sys/class/android_usb/android0/f_mass_storage/rom/file
                                                     ;;
                                       "tycharging,adb")
                                                     loge "uninstall cdrom_install.iso"
                                                     echo "" > /sys/class/android_usb/android0/f_mass_storage/rom/file
                                                     ;;

                                        *)
                                                     loge "install cdrom_install.iso"
                                                     echo $cdromname > /sys/class/android_usb/android0/f_mass_storage/rom/file
                                                     chmod 664 /sys/class/android_usb/android0/f_mass_storage/rom/file
                                                     ;;
                                esac
                                ;;
                esac
                ;;
esac
