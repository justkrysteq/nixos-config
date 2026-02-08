{ ... }:

{
	xdg.configFile = {
		"scripts/general/minimize-window.sh" = {
			source = ./general/minimize-window.sh;
			executable = true;
		};

		"scripts/lockscreen/weekday.sh" = {
			source = ./lockscreen/weekday.sh;
			executable = true;
		};
		"scripts/lockscreen/network-status.sh" = {
			source = ./lockscreen/network-status.sh;
			executable = true;
		};
		"scripts/lockscreen/battery-status.sh" = {
			source = ./lockscreen/battery-status.sh;
			executable = true;
		};
	};
}
