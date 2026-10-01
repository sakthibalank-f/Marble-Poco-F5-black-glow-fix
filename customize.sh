#!/system/bin/sh
# Black Color Glow Fix - POCO F5 / Redmi Note 12 Turbo (marble)
# Source: Evolution-X-Devices/vendor_xiaomi_marble@cb5cb30
# Works with KernelSU / APatch / Magisk (systemless overlay on /vendor)

D1="$(getprop ro.product.device)"
D2="$(getprop ro.product.vendor.device)"
case "$D1$D2" in
  *marble*) ;;
  *) abort "! This module is only for marble (POCO F5). Detected: '$D1' '$D2'" ;;
esac

ui_print "- Black Color Glow Fix v0.3"
ui_print "- Installing display calibration + panel configs"

# vendor config files need the vendor_configs_file SELinux label
set_perm_recursive "$MODPATH/system" 0 0 0755 0644
set_perm_recursive "$MODPATH/system/vendor" 0 0 0755 0644 u:object_r:vendor_configs_file:s0

for f in "$MODPATH"/system/vendor/etc/display/*.json "$MODPATH"/system/vendor/etc/*.xml; do
  ui_print "  + /vendor/${f#$MODPATH/system/vendor/}"
done
ui_print "- Done. Reboot to apply."
