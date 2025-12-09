{ ... }:

{
	powerManagement = {
		enable = true;
		powertop.enable = true;
		# cpuFreqGovernor = "schedutil";
		# cpuFreqGovernor = "powersave"; # powersave, performance, ondemand
	};

	services = {
		system76-scheduler.settings.cfsProfiles.enable = true; # Better scheduling for CPU cycles

		tlp = {
			enable = true;
			settings = {
				CPU_BOOST_ON_AC = 1;
				CPU_BOOST_ON_BAT = 0;
				CPU_HWP_DYN_BOOST_ON_AC = 1;
				CPU_HWP_DYN_BOOST_ON_BAT = 1;
				CPU_SCALING_GOVERNOR_ON_AC = "performance";
				CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
				CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
				CPU_ENERGY_PERF_POLICY_ON_BAT = "power"; # performance, balance_power, power
				PLATFORM_PROFILE_ON_AC = "performance";
				PLATFORM_PROFILE_ON_BAT = "low-power"; # balanced, performance, low-power
				START_CHARGE_THRESH_BAT0 = 75;
				STOP_CHARGE_THRESH_BAT0 = 81;
			};
		};
	};

	boot = {
		kernel.sysctl = {
			"vm.laptop_mode" = 5;
		};

		kernelParams = [
			"nmi_watchdog=0"
		];
	};

	# TODO: Read https://wiki.archlinux.org/title/Power_management
	# and configure accordingly
	# Also check if thermald confilicts with tlp
}
