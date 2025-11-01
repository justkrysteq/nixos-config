import AstalBattery from "gi://AstalBattery";

export function getBatteryPercentage(battery: AstalBattery.Device) {
	const percent = battery.percentage;

	return Math.floor(percent * 100).toString();
}

export function getBatteryIcon(battery: AstalBattery.Device) {
	const percent = battery.percentage;

	if (battery.state === AstalBattery.State.CHARGING) { 
		if (percent == 0) {
			return "󰢟";
		} else if (percent <= 0.1) {
			return "󰢜";
		} else if (percent <= 0.2) {
			return "󰂆";
		} else if (percent <= 0.3) {
			return "󰂇";
		} else if (percent <= 0.4) {
			return "󰂈";
		} else if (percent <= 0.5) {
			return "󰢝";
		} else if (percent <= 0.6) {
			return "󰂉";
		} else if (percent <= 0.7) {
			return "󰢞";
		} else if (percent <= 0.8) {
			return "󰂊";
		} else if (percent <= 0.9) {
			return "󰂋";
		} else {
			return "󰂅";
		}
	} else {
		if (percent == 0) {
			return "󰂎";
		} else if (percent <= 0.1) {
			return "󰁺";
		} else if (percent <= 0.2) {
			return "󰁻";
		} else if (percent <= 0.3) {
			return "󰁼";
		} else if (percent <= 0.4) {
			return "󰁽";
		} else if (percent <= 0.5) {
			return "󰁾";
		} else if (percent <= 0.6) {
			return "󰁿";
		} else if (percent <= 0.7) {
			return "󰂀";
		} else if (percent <= 0.8) {
			return "󰂁";
		} else if (percent <= 0.9) {
			return "󰂂";
		} else {
			return "󰁹";
		}
	}
}
