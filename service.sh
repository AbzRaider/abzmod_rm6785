# This script will be executed in late_start service mode
# More info in the main Magisk thread
sleep 40
#Configure peak and max RR for Dynamic RR
settings put system min_refresh_rate 60.0
settings put system peak_refresh_rate  90.0
SELINUX_STATUS=$(getenforce)
setenforce 0
stop thermald

#set GED to defaults
echo 0 >/sys/module/ged/parameters/gx_game_mode
	echo 0 >/sys/module/ged/parameters/gx_force_cpu_boost
	echo 0 > /sys/module/ged/parameters/boost_amp
	echo 0 > /sys/module/ged/parameters/boost_extra
	echo 0 > /sys/module/ged/parameters/boost_gpu_enable
	echo 0 > /sys/module/ged/parameters/enable_cpu_boost
	echo 0 > /sys/module/ged/parameters/enable_gpu_boost
	echo 0 > /sys/module/ged/parameters/enable_game_self_frc_detect
	echo 20 > /sys/module/ged/parameters/gpu_idle
	echo 0 > /sys/module/ged/parameters/cpu_boost_policy
	echo 0 > /sys/module/ged/parameters/ged_force_mdp_enable
	echo 0 > /sys/module/ged/parameters/ged_boost_enable
	echo 0 > /sys/module/ged/parameters/ged_smart_boost
	echo 0 > /sys/module/ged/parameters/gx_frc_mode
	echo 0 > /sys/module/ged/parameters/gx_boost_on


#ThermalZones
echo disabled > /sys/class/thermal/thermal_zone1/mode
echo disabled > /sys/class/thermal/thermal_zone2/mode
echo disabled > /sys/class/thermal/thermal_zone3/mode
echo disabled > /sys/class/thermal/thermal_zone4/mode
echo disabled > /sys/class/thermal/thermal_zone5/mode
echo disabled > /sys/class/thermal/thermal_zone6/mode
echo disabled > /sys/class/thermal/thermal_zone7/mode
echo disabled > /sys/class/thermal/thermal_zone8/mode
echo disabled > /sys/class/thermal/thermal_zone9/mode
echo disabled > /sys/class/thermal/thermal_zone10/mode
echo disabled > /sys/class/thermal/thermal_zone11/mode
echo disabled > /sys/class/thermal/thermal_zone12/mode
echo disabled > /sys/class/thermal/thermal_zone13/mode
echo disabled > /sys/class/thermal/thermal_zone14/mode
echo disabled > /sys/class/thermal/thermal_zone15/mode
echo disabled > /sys/class/thermal/thermal_zone16/mode
echo disabled > /sys/class/thermal/thermal_zone17/mode
echo disabled > /sys/class/thermal/thermal_zone18/mode
echo disabled > /sys/class/thermal/thermal_zone19/mode
echo disabled > /sys/class/thermal/thermal_zone20/mode
echo disabled > /sys/class/thermal/thermal_zone21/mode
echo disabled > /sys/class/thermal/thermal_zone24/mode

stop thermal
stop thermald
setprop init.svc.vendor.thermal-hal-2-0.mtk 1
setprop init.svc.vendor.thermal-hal-2-0.mtk 1
setprop vendor.thermal-hal-2-0.mtk 0
start init.svc.vendor.thermal-hal-2-0.mtk
start vendor.thermal-hal-2-0.mtk
stop vendor.thermal-hal-1-0
stop thermalloadalgod
setprop init.svc_debug_pid.thermal 1100
setprop vendor.thermal.manager.data 1
setprop vendor.thermal.manager.data.perf 100
setprop init.svc.thermalloadalgod false
setprop fku.perf.profile 2
echo N > /sys/module/battery_saver/parameters/enabled


#Sched-Walt
echo '0' > /proc/sys/kernel/sched_use_walt_cpu_util
echo '0' > /proc/sys/kernel/sched_use_walt_task_util
#Touchpanel
echo '1' > /proc/touchpanel/game_switch_enable
echo '5' > /proc/touchpanel/sensitive_level
echo '1' > /proc/touchpanel/smooth_level
#Limiters
echo '1' >  /proc/perfmgr/syslimiter/syslimiter_force_disable
#Kernel
echo '51' > /proc/sys/kernel/boost_task_threshold
echo '1' > /proc/sys/kernel/slide_boost_enabled
echo '1' > /proc/sys/kernel/launcher_boost_enabled
#Sched
echo '0' > /sys/devices/system/cpu/eas/enable

	#EaraThermal
   echo 0 > /sys/kernel/eara_thermal/fake_throttle
   echo 0 > /sys/kernel/eara_thermal/enable

#EnableFastCharge
echo "0" >/proc/fastchg_fw_update
echo "1" >/proc/fastchg_fw_update


     #CoolDownEnable
     echo 0 > /sys/class/power_supply/charger/subsystem/battery/cool_down


# lock GPU frequency to highest for best gaming experience
	echo Lock GPU to 900MHz
	echo 806000 >/proc/gpufreq/gpufreq_opp_freq
        echo set Min Freq to 480mhz
       echo 270000 > /sys/module/ged/parameters/gpu_bottom_freq
	echo Done
	

#EnableFastCharge
echo "1" >/proc/fastchg_fw_update

echo GED Modules enabled


# change CPU mode
echo 1 > /proc/cpufreq/cpufreq_cci_mode
echo 3 > /proc/cpufreq/cpufreq_power_mode
echo "0 2 5 11 2 16" > /proc/driver/thermal/clatm_cpu_min_opp
echo "0 2 5 11 2 16"> /proc/driver/thermal/clatm_cpu_min_opp
echo 1 > /proc/cpufreq/cpufreq_imax_enable
echo 0 > /proc/cpufreq/cpufreq_imax_thermal_protect
echo 7 > /proc/cpufreq/MT_CPU_DVFS_CCI/cpufreq_turbo_mode
echo switch 0 > /proc/driver/thermal/tztsAll_enable
echo "turbo_mode 1,0,0" > /proc/cpufreq/MT_CPU_DVFS_CCI/cpufreq_turbo_mode
echo "16" > /proc/sys/kernel/perf_cpu_time_max_percent
echo "1">/proc/perfmgr/boost_ctrl/eas_ctrl/perfserv_ta_boost

# increase performance
	echo 1 > /sys/devices/system/cpu/perf/enable


# PPM
echo "1"> /proc/ppm/enabled
        echo  "1"> /proc/ppm/profile/profile_on
	echo 0 0> /proc/ppm/policy_status
	echo 1 1> /proc/ppm/policy_status
	echo 2 0> /proc/ppm/policy_status
	echo 3 0> /proc/ppm/policy_status
	echo 4 0> /proc/ppm/policy_status
	echo 5 0> /proc/ppm/policy_status
	echo 6 0> /proc/ppm/policy_status
	echo 7 0> /proc/ppm/policy_status
	echo 8 0> /proc/ppm/policy_status
	echo 9 1> /proc/ppm/policy_status

# change Governor to performance(Freezes on schedutil)
	echo Change Governor to performance
	echo performance > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
	echo performance > /sys/devices/system/cpu/cpufreq/policy6/scaling_governor
	

#RAM Optimizations
echo 90 > /proc/sys/vm/vfs_cache_pressure
echo 10> /proc/sys/vm/stat_interval
echo 9> /proc/sys/vm/dirty_ratio
echo 3> /proc/sys/vm/dirty_background_ratio
echo 136>/proc/sys/vm/swappiness
echo 150>/proc/sys/kernel/sched_stune_task_threshold
echo 11060>/proc/sys/vm/dirty_writeback_centisecs


# Fix Touch Screen
echo Fix Touch Screen by enable Oplus TP Direction and disable limit
echo 1> /proc/touchpanel/oplus_tp_direction
echo 0> /proc/touchpanel/oplus_tp_limit_enable
echo 1> /proc/touchpanel/oppo_tp_direction
echo 0> /proc/touchpanel/oppo_tp_limit_enable
echo 0> /proc/touchpanel/game_switch_enable
	
# Disable CABC 
echo Disable CABC Mode for best experience
echo "0" > /sys/kernel/oppo_display/LCM_CABC
	
# Disable some debugging
echo "0" > /sys/kernel/ccci/debug
setprop debug.mediatek.high_frame_rate_multiple_display_mode 0
setprop debug.sf.disable_backpressure 0
	
## POWERHAL SPORT MODE
	echo Add some games to sport mode
	echo -e "com.mobile.legends\ncom.tencent.ig\nskynet.cputhrottlingtest\ncom.miHoYo.GenshinImpact\ncom.pubg.krmobile\ncom.tencent.tmgp.pubgmhd\ncom.dts.freefireth\ncom.dts.freefiremax\njp.konami.pesam\ncom.pubg.newstate\ncom.garena.game.codm\ncom.pubg.imobile\ncom.ea.gp.apexlegendsmobilefps\ncom.riotgames.league.wildrift\n" > /data/vendor/powerhal/smart
	echo Done

# CPUStune
	echo Tune CPU Load to high priority for big Cluster

#Foreground
echo 90>/dev/stune/foreground/schedtune.boost
	echo 0> /dev/stune/foreground/schedtune.prefer_idle

	# Realtime
	echo 90 > /dev/stune/rt/schedtune.boost
	echo 1 > /dev/stune/rt/schedtune.prefer_idle
	
	# Background
	echo 0> /dev/stune/background/schedtune.util.max.effective
	echo 0> /dev/stune/background/schedtune.util.min.effective
	echo 0> /dev/stune/background/schedtune.util.max
	echo 0> /dev/stune/background/schedtune.util.min
	echo 0> /dev/stune/background/schedtune.boost
	echo 0> /dev/stune/background/schedtune.prefer_idle

# Top-App
	echo 1024> /dev/stune/top-app/schedtune.util.max.effective
	echo 0> /dev/stune/top-app/schedtune.util.min.effective
	echo 1024> /dev/stune/top-app/schedtune.util.max
	echo 0>/dev/stune/top-app/schedtune.util.min
	echo 90>/dev/stune/top-app/schedtune.boost
	echo 0>/dev/stune/top-app/schedtune.prefer_idle

# Global
	echo 0> /dev/stune/schedtune.util.min
	echo 1024> /dev/stune/schedtune.util.max
	echo 1024> /dev/stune/schedtune.util.max.effective
	echo 0> /dev/stune/schedtune.util.min.effective
	echo 0> /dev/stune/schedtune.boost
	echo 0> /dev/stune/schedtune.prefer_idle
	echo Done
	echo

# This script made by @AbzRaider
#Mod of RyuX2.3 with RUI 1 Perf Profile Kang

	# force sched to EAS
	echo 1 > /sys/devices/system/cpu/eas/enable

	echo 650000> /sys/devices/system/cpu/cpufreq/schedutil/down_rate_limit_us
	echo 0> /sys/devices/system/cpu/cpufreq/schedutil/up_rate_limit_us


#Disable-TimerMigration
echo "0"> /proc/sys/kernel/timer_migration



## limit minimum CPU frequency
	echo Lock big CPU to 2050MHz
	# big cluster
	echo 1 2050000 >/proc/ppm/policy/hard_userlimit_max_cpu_freq
	echo 1 2000000 >/proc/ppm/policy/hard_userlimit_min_cpu_freq
    echo Done
    echo

	# LITTLE cluster
	echo Lock LITTLE CPU to 2000MHz
	echo 0 2000000 >/proc/ppm/policy/hard_userlimit_max_cpu_freq
	echo 0 2000000 >/proc/ppm/policy/hard_userlimit_min_cpu_freq
	echo Done
	echo

    # VM
    echo Clear RAM Cache aggressive
    echo 3 > /proc/sys/vm/drop_caches
    sleep 8
    echo Stop Cache Cleanup
    echo 1 > /proc/sys/vm/drop_caches

# Update touchpanel firmware in case we ship newer firmware in /odm
    write /proc/touchpanel/tp_fw_update 1
    sleep 5
    write /proc/touchpanel/tp_fw_update 0
	
#DalvikOAT Tweaks
setprop pm.dexopt.first-boot speed
setprop pm.dexopt.install speed
setprop pm.dexopt.boot speed
setprop pm.dexopt.bg-dexopt speed-profile
setprop pm.dexopt.shared speed
setprop pm.dexopt.bg-dexopt speed
setprop pm.dexopt.shared speed
setprop dalvik.vm.usejit true
setprop dalvik.vm.dexopt-flags m=y,v=n,o=v
setprop dalvik.vm.check-dex-sum false
setprop dalvik.vm.debug.alloc 0
setprop dalvik.vm.deadlock-predict off
setprop dalvik.vm.verify-bytecode false
setprop dalvik.vm.heapstartsize 16m
setprop dalvik.vm.heapgrowthlimit 384m
setprop dalvik.vm.heapsize 768m
setprop dalvik.vm.heaptargetutilization 0.73
setprop dalvik.vm.image-dex2oat-filter quicken
setprop dalvik.vm.image-dex2oat-threads 8
setprop dalvik.vm.image-dex2oat-cpu-set 0,1,2,3,4,5,6,7
setprop dalvik.vm.dex2oat-minidebuginfo false
setprop dalvik.vm.dex2oat-flags --no-watch-dog
setprop dalvik.vm.dex2oat64.enabled true
setprop dalvik.vm.dex2oat-filter quicken
setprop dalvik.vm.dex2oat-threads 8
setprop dalvik.vm.dex2oat-cpu-set 0,1,2,3,4,5,6,7
setprop dalvik.vm.boot-dex2oat-threads 8
setprop dalvik.vm.boot-dex2oat-cpu-set 0,1,2,3,4,5,6,7

#VendorFixes
setprop persist.vendor.qti.games.gt.prof 1
setprop persist.vendor.qti.games.at.prof 1
setprop vendor.display.disable_skip_validate 1
setprop persist.vendor.dfps.level 90
setprop persist.vendor.vcb.ability true
setprop persist.vendor.power.dfps.level 0
setprop debug.fb.rgb565 1
setprop debug.gralloc.enable_fb_ubwc 1

# GPU Cache
setprop ro.hwui.disable_scissor_opt false
setprop ro.zygote.disable_gl_preload false
setprop ro.hwui.texture_cache_size 196
setprop ro.hwui.layer_cache_size 64
setprop ro.hwui.gradient_cache_size 16
setprop ro.hwui.patch_cache_size 128
setprop ro.hwui.path_cache_size 64
setprop ro.hwui.shape_cache_size 256
setprop ro.hwui.drop_shadow_cache_size 16
setprop ro.hwui.r_buffer_cache_size 96
setprop ro.hwui.texture_cache_flush_rate 0.6
setprop ro.hwui.text_small_cache_width 1024
setprop ro.hwui.text_small_cache_height 256
setprop ro.hwui.text_large_cache_width 2048
setprop ro.hwui.text_large_cache_height 512
setprop ro.hwui.r_buffer_cache_size 8
setprop ro.hwui.fbo_cache_size 0
setprop hwui.text_gamma 1.4
setprop hwui.text_gamma.black_threshold 64
setprop hwui.text_gamma.white_threshold 192
setprop hwui.use_gpu_pixel_buffers true
setprop config.disable_rtt true
setprop debug.hwui.enable_bp_cache false
setprop debug.hwui.profile false
setprop debug.hwui.profile.maxframes 90
setprop debug.hwui.skip_empty_damage true
setprop debug.hwui.use_buffer_age false
setprop debug.hwui.use_partial_updates true
setprop debug.hwui.use_gpu_pixel_buffers false
setprop debug.hwui.render_dirty_regions false
setprop debug.hwui.show_dirty_regions false
setprop DEBUG_DIRTY_REGION false



echo 1 > /sys/kernel/fpsgo/fbt/boost_ta
echo 61 > /sys/module/fbt_cpu/parameters/fps_level_range
echo 15 > /sys/module/fbt_cpu/parameters/bhr_opp
echo 90 >/sys/kernel/fpsgo/common/gpu_block_boost

#CPUSetsforMT6785


echo 0-7> /dev/cpuset/foreground/cpus
echo 2-4> /dev/cpuset/background/cpus
echo 0-3> /dev/cpuset/system-background/cpus
echo 0-7> /dev/cpuset/top-app/cpus
echo 0-4> /dev/cpuset/restricted/cpus
echo 0-7>/dev/cpuset/camera-daemon/cpus

echo "tencent.tmgp.sgame 2 60-34 30-30/ncom.ea.gp.apexlegendsmobilefps 2 60-34 30-30/ncom.mobile.legends 2 60-34 30-30/ncom.pubg.imobile  2 60-34 30-30/ncom.ak.mi 2 60-60 30-30/ntencent.tmgp.ak 2 60-60 30-30/nm.tencent.cldts 2 60-60 30-30/ngp.yongyong.zjz 2 60-60 30-30/n.ANMP.GloftA8HM 1 30-30/ncom.netease.zjz 2 60-60 30-30/nassassin.pirates 1 60-30/nMainThread-UE4 5 60-44 40-34 30-30 25-25 20-20/ntmgp.speedmobile 2 60-60 30-30/nskynet.cputhrottlingtest" >/sys/kernel/fpsgo/fstb/fstb_fps_list	
echo 100 >/sys/module/fbt_cpu/parameters/bhr
echo "com.mobile.legends\ncom.tencent.ig\nskynet.cputhrottlingtest\ncom.miHoYo.GenshinImpact\ncom.pubg.krmobile\ncom.tencent.tmgp.pubgmhd\ncom.dts.freefireth\ncom.dts.freefiremax\njp.konami.pesam\ncom.pubg.newstate\ncom.garena.game.codm\ncom.pubg.imobile\ncom.ea.gp.apexlegendsmobilefps\ncom.riotgames.league.wildrift" > /sys/kernel/debug/fpsgo/fstb/fstb_fteh_list
echo 95 > /sys/kernel/debug/ged/hal/gpu_boost_level
echo "Y" > /sys/kernel/debug/mali0/ctx/defaults/infinite_cache
echo 0 > /sys/kernel/debug/fpsgo/minitop/enable
echo 0 > /sys/kernel/debug/fpsgo/fbt/enable_switch_down_throttle
echo 1 > /sys/kernel/debug/fpsgo/fbt/enable_uclamp_boost
echo "25" > /sys/kernel/debug/fpsgo/fbt/light_loading_policy



setenforce $SELINUX_STATUS