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
   echo 0 > /sys/kernel/debug/eara_thermal/fake_throttle
   echo 0 > /sys/kernel/debug/eara_thermal/enable

#EnableFastCharge
echo "0" >/proc/fastchg_fw_update
echo "1" >/proc/fastchg_fw_update


     #CoolDownEnable
     echo 0 > /sys/class/power_supply/charger/subsystem/battery/cool_down

	 #GED modules
    echo Enabling GED Modules
	echo 0 >/sys/module/ged/parameters/gx_game_mode
	echo 1 >/sys/module/ged/parameters/gx_force_cpu_boost
	echo 0 > /sys/module/ged/parameters/boost_amp
	echo 1 > /sys/module/ged/parameters/boost_extra
	echo 1 > /sys/module/ged/parameters/boost_gpu_enable
	echo 1 > /sys/module/ged/parameters/enable_cpu_boost
	echo 1 > /sys/module/ged/parameters/enable_gpu_boost
	echo 1 > /sys/module/ged/parameters/enable_game_self_frc_detect
	echo 0 > /sys/module/ged/parameters/gpu_idle
echo 0 > /sys/module/ged/parameters/ged_boost_enable
	echo 0 > /sys/module/ged/parameters/ged_smart_boost
	echo 0 > /sys/module/ged/parameters/gx_frc_mode
	echo 0 > /sys/module/ged/parameters/gx_boost_on
	echo GED Modules enabled
	echo
	
    #Change CPU mode
    echo Change CPU Mode to Sports Mode
	echo 3 > /proc/cpufreq/cpufreq_power_mode
	echo 1 > /proc/cpufreq/cpufreq_cci_mode
	echo Done
	echo
	
	# set sched to HMP
	echo Change kernel mode to HMP Mode
	echo 0 > /sys/devices/system/cpu/eas/enable
	echo Done
	echo

# TCP
echo TCP Congestion Control
echo cubic > /proc/sys/net/ipv4/tcp_congestion_control
cat /proc/sys/net/ipv4/tcp_congestion_control
echo Enable TCP low latency
echo 1 > /proc/sys/net/ipv4/tcp_low_latency

#RAM Optimizations
echo 90 > /proc/sys/vm/vfs_cache_pressure
echo 10> /proc/sys/vm/stat_interval
echo 9> /proc/sys/vm/dirty_ratio
echo 3> /proc/sys/vm/dirty_background_ratio
echo 136>/proc/sys/vm/swappiness
echo 95 >/proc/sys/kernel/sched_stune_task_threshold
	
	# increase performance
	echo 1 > /sys/devices/system/cpu/perf/enable

    # lock GPU frequency to highest for best gaming experience
    echo Lock GPU to 806MHz
	echo 806000 > /proc/gpufreq/gpufreq_opp_freq
	echo Done
	echo
	
	echo Disable Throttle Thermal
	echo Warning! Your phone might be exploded

	# enable PPM
	echo 1 > /proc/ppm/enabled
	echo 0 1 > /proc/ppm/policy_status
    echo 1 0 > /proc/ppm/policy_status
    echo 2 1 > /proc/ppm/policy_status
    echo 3 0 > /proc/ppm/policy_status
    echo 4 0 > /proc/ppm/policy_status
    echo 5 1 > /proc/ppm/policy_status
    echo 6 1 > /proc/ppm/policy_status
    echo 7 1 > /proc/ppm/policy_status
    echo 8 1 > /proc/ppm/policy_status
    echo 9 1 > /proc/ppm/policy_status
    echo Done
    echo

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


    
    # change Governor to performance
    echo Change Governor to performance
    echo performance > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
    echo performance > /sys/devices/system/cpu/cpufreq/policy6/scaling_governor
    echo Done
    echo
    
	## limit minimum CPU frequency
	echo Lock big CPU to 2050MHz
	# big cluster
	echo 1 2050000 >/proc/ppm/policy/hard_userlimit_max_cpu_freq

    echo Done
    echo

	# LITTLE cluster
	echo Lock LITTLE CPU to 2000MHz
	echo 0 2000000 >/proc/ppm/policy/hard_userlimit_max_cpu_freq
	echo Done
	echo

       # schedutil rate-limit
       echo 65536 > /sys/devices/system/cpu/cpufreq/schedutil/down_rate_limit_us
       echo 0 > /sys/devices/system/cpu/cpufreq/schedutil/up_rate_limit_us
	
	#Game Touch Sampling
	echo Enabling Game Touch Sampling Boost
	echo 0 > /proc/touchpanel/game_switch_enable
	echo Done
	echo

	# Disable CABC 
	echo Disable CABC Mode for best experience
	echo 0 > /sys/kernel/oppo_display/cabc
	echo Done
	echo
	
     	# GPU frequency
	echo GPU Frequency
        echo 806000 > /proc/gpufreq/gpufreq_opp_freq
	echo 900000 > /proc/gpufreq/gpufreq_opp_freq
	cat /proc/gpufreq/gpufreq_opp_freq | cut -d, -f1
	echo
	
	# GPU Power Policy
	echo GPU Power Policy
	echo 1 > /proc/mali/always_on
	cat /proc/mali/always_on
	echo always_on > /sys/devices/platform/13040000.mali/power_policy
	cat /sys/devices/platform/13040000.mali/power_policy
	echo
     

	#CPUStune
	echo CPU Tuning time
	
		# CPU Load settings
	echo 0-7 > /dev/cpuset/foreground/cpus
	echo 0-3 > /dev/cpuset/background/cpus
	echo 0-7 > /dev/cpuset/system-background/cpus
	echo 0-7 > /dev/cpuset/top-app/cpus
	echo 0 > /dev/cpuset/restricted/cpus
    echo Done

#RAM Optimizations
echo 90 > /proc/sys/vm/vfs_cache_pressure
echo 10 > /proc/sys/vm/stat_interval
echo 9 > /proc/sys/vm/dirty_ratio
echo 3 > /proc/sys/vm/dirty_background_ratio
echo 136 >/proc/sys/vm/swappiness

# Realtime
	echo 30 > /dev/stune/rt/schedtune.boost
	echo 1 > /dev/stune/rt/schedtune.prefer_idle
	
	# Background
	echo 0 > /dev/stune/background/schedtune.util.max.effective
	echo 0 > /dev/stune/background/schedtune.util.min.effective
	echo 0 > /dev/stune/background/schedtune.util.max
	echo 0 > /dev/stune/background/schedtune.util.min
	echo 8 > /dev/stune/background/schedtune.boost
	echo 1 > /dev/stune/background/schedtune.prefer_idle
	
	# Foreground
	echo 1024 > /dev/stune/foreground/schedtune.util.max.effective
	echo 0 > /dev/stune/foreground/schedtune.util.min.effective
	echo 1024 > /dev/stune/foreground/schedtune.util.max
	echo 0 > /dev/stune/foreground/schedtune.util.min
	echo 0 > /dev/stune/foreground/schedtune.boost
	echo 0 > /dev/stune/foreground/schedtune.prefer_idle
	
	# Top-App
	echo 1024 > /dev/stune/top-app/schedtune.util.max.effective
	echo 1024 > /dev/stune/top-app/schedtune.util.max
	echo 90 > /dev/stune/top-app/schedtune.boost
	echo 0 > /dev/stune/top-app/schedtune.prefer_idle
	
	# Global
	echo 0 > /dev/stune/schedtune.util.min
	echo 1024 > /dev/stune/schedtune.util.max
	echo 1024 > /dev/stune/schedtune.util.max.effective
	echo 0 > /dev/stune/schedtune.util.min.effective
	echo 0 > /dev/stune/schedtune.boost
	echo 0 > /dev/stune/schedtune.prefer_idle
	echo
			
	echo High Performance Mode activated

# POWERHAL SPORT MODE
	echo Add some games to sport mode
	echo -e "com.mobile.legends\ncom.tencent.ig\nskynet.cputhrottlingtest\ncom.miHoYo.GenshinImpact\ncom.pubg.krmobile\ncom.tencent.tmgp.pubgmhd\ncom.dts.freefireth\ncom.dts.freefiremax\njp.konami.pesam\ncom.pubg.newstate\ncom.garena.game.codm\ncom.pubg.imobile\ncom.ea.gp.apexlegendsmobilefps\ncom.riotgames.league.wildrift\ncom.antutu.ABenchMark\ncom.primatelabs.geekbench" > /data/vendor/powerhal/smart
	echo Done


echo 0 > /proc/cpufreq/cpufreq_imax_enable
echo 1 > /proc/cpufreq/cpufreq_imax_thermal_protect
echo 45000 > /proc/sys/kernel/threads-max
echo 16 > /proc/sys/kernel/perf_cpu_time_max_percent
echo 0 > /sys/kernel/fpsgo/fstb/margin_mode

echo 1 > /sys/kernel/debug/fpsgo/fbt/boost_ta
echo 61 > /sys/module/fbt_cpu/parameters/fps_level_range
echo 15 > /sys/module/fbt_cpu/parameters/bhr_opp
echo 90 >/sys/kernel/debug/fpsgo/common/gpu_block_boost
echo "tencent.tmgp.sgame 2 60-34 30-30/ncom.ea.gp.apexlegendsmobilefps 2 60-34 30-30/ncom.mobile.legends 2 60-34 30-30/ncom.pubg.imobile  2 60-34 30-30/ncom.ak.mi 2 60-60 30-30/ntencent.tmgp.ak 2 60-60 30-30/nm.tencent.cldts 2 60-60 30-30/ngp.yongyong.zjz 2 60-60 30-30/n.ANMP.GloftA8HM 1 30-30/ncom.netease.zjz 2 60-60 30-30/nassassin.pirates 1 60-30/nMainThread-UE4 5 60-44 40-34 30-30 25-25 20-20/ntmgp.speedmobile 2 60-60 30-30/nskynet.cputhrottlingtest" >/sys/kernel/debug/fpsgo/fstb/fstb_fps_list	
echo 2 > /sys/kernel/debug/fpsgo/fstb/margin_mode			
	echo High Performance Mode activated
	echo For best experience, please enable all CPU
	echo
	echo This script made by @zidaneharith
	echo Last updated : 15:51p.m. 6/7/2021


echo chmod 1 > /proc/driver/thermal/clatm_cpu_min_opp
#MTKTaskTurbo
echo 10 > /sys/module/task_turbo/parameters/feats
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
echo 95 > /sys/kernel/debug/fpsgo/fstb/fstb_tune_quantile
echo 9 > /sys/kernel/debug/fpsgo/fstb/margin_mode_dbnc_a
echo 1 > /sys/kernel/debug/fpsgo/fstb/margin_mode_dbnc_b

echo 25 > /sys/kernel/debug/fpsgo/fbt/light_loading_policy
chmod 0444 sys/module/ged/parameters/enable_cpu_boost
echo 40000000 > /proc/perfmgr/boost_ctrl/eas_ctrl/perfserv_schedplus_up_throttle
echo -1 > /proc/perfmgr/boost_ctrl/eas_ctrl/perfserv_schedplus_down_throttle
echo 40000000 > /proc/perfmgr/boost_ctrl/eas_ctrl/debug_schedplus_up_throttle
echo -1 > /proc/perfmgr/boost_ctrl/eas_ctrl/debug_schedplus_down_throttle
echo 1 > /proc/perfmgr/boost_ctrl/eas_ctrl/perfserv_ta_boost



setenforce $SELINUX_STATUS
