#! /bin/sh

if [ ! -d "/data/tp" ]; then
    mkdir /data/tp
    chmod 0775 /data/tp
    chown system:system /data/tp
else
    rm /data/tp/*
fi

# Goodix GT915L

if [ -e "/sys/bus/i2c/devices/5-005d/ic_ver" ]; then
	ln -s /sys/bus/i2c/devices/5-005d/ic_ver /data/tp/ic_ver
fi

if [ -e "/sys/bus/i2c/devices/5-005d/wakeup_gesture" ]; then
	chown system:system /sys/bus/i2c/devices/5-005d/wakeup_gesture
	ln -s /sys/bus/i2c/devices/5-005d/wakeup_gesture /data/tp/easy_wakeup_gesture
fi

if [ -e "/sys/gtp_test/opentest" ]; then
    ln -s /sys/gtp_test/opentest /data/tp/ic_detect
fi

# ==============================================================================
# Cypress TMA463

if [ -e "/sys/bus/ttsp4/devices/main_ttsp_core.cyttsp4_i2c_adapter/ic_ver" ]; then
	ln -s /sys/bus/ttsp4/devices/main_ttsp_core.cyttsp4_i2c_adapter/ic_ver /data/tp/ic_ver
fi

if [ -e "/sys/bus/ttsp4/devices/cyttsp4_device_access.main_ttsp_core/ic_grpdetect" ]; then
	ln -s /sys/bus/ttsp4/devices/cyttsp4_device_access.main_ttsp_core/ic_grpdetect /data/tp/ic_detect
fi

if [ -e "/sys/bus/ttsp4/devices/cyttsp4_loader.main_ttsp_core/manual_cali" ]; then
	ln -s /sys/bus/ttsp4/devices/cyttsp4_loader.main_ttsp_core/manual_cali /data/tp/manual_cali
fi

if [ -e "/sys/bus/ttsp4/devices/cyttsp4_loader.main_ttsp_core/fw_upgrade_flag" ]; then
	ln -s /sys/bus/ttsp4/devices/cyttsp4_loader.main_ttsp_core/fw_upgrade_flag /data/tp/fw_upgrade_flag
fi

if [ -e "/sys/bus/ttsp4/devices/main_ttsp_core.cyttsp4_i2c_adapter/easy_wakeup_gesture" ]; then
	chown system:system /sys/bus/ttsp4/devices/main_ttsp_core.cyttsp4_i2c_adapter/easy_wakeup_gesture
	ln -s /sys/bus/ttsp4/devices/main_ttsp_core.cyttsp4_i2c_adapter/easy_wakeup_gesture /data/tp/easy_wakeup_gesture
fi

# ==============================================================================
# Synaptics S3208 S3508

if [ -e "/sys/class/input/input0/buildid" ]; then
	ln -s /sys/class/input/input0/buildid /data/tp/ic_ver
fi

if [ -e "/sys/class/input/input0/reset" ]; then
	ln -s /sys/class/input/input0/reset /data/tp/reset
fi

if [ -e "/sys/class/input/input0/wakeup_gesture" ]; then
	chown system:system /sys/class/input/input0/wakeup_gesture
	ln -s /sys/class/input/input0/wakeup_gesture /data/tp/easy_wakeup_gesture
fi

if [ -e "/sys/class/input/input0/f54/factory_result" ]; then
	ln -s /sys/class/input/input0/f54/factory_result /data/tp/ic_detect
fi

# ==============================================================================
