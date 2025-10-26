// TODO: Fix wifi and wired connection handling

import AstalNetwork from "gi://AstalNetwork";

export function getNetworkStrength(network: AstalNetwork.Network) {
	const { wifi, wired } = network;

	if (wifi.strength !== 0) {
		const { strength, internet, enabled } = wifi;

		if (enabled && internet === AstalNetwork.Internet.CONNECTED) {
			return strength.toString();
		}
	}

	if (wired.speed !== 0) {
		return "eth";
	}

	return "x";
}

export function getNetworkSpeed(network: AstalNetwork.Network) {
	const { wired } = network;

	if (wired.speed !== 0) {
		const { speed, internet } = wired;

		if (internet === AstalNetwork.Internet.CONNECTED) {
			return speed.toString();
		}
	}

	return "wifi";
}

export function getNetworkIcon(network: AstalNetwork.Network) {
	const { connectivity, wifi, wired } = network;

	if (wired.speed !== 0) {
		if (wired.internet === AstalNetwork.Internet.CONNECTED) {
			return '󰈀';
		} else {
			return '󰈀'; // You could add more logic here for wired states if needed
		}
	}

	if (wifi.strength !== 0) {
		const { strength, internet, enabled } = wifi;

		if (!enabled || connectivity === AstalNetwork.Connectivity.NONE) {
			return '󰤭';
		}

		if (strength <= 25) {
			if (internet === AstalNetwork.Internet.DISCONNECTED) {
				return '󰤠';
			} else if (internet === AstalNetwork.Internet.CONNECTED) {
				return '󰤟';
			} else if (internet === AstalNetwork.Internet.CONNECTING) {
				return '󰤡';
			}
		} else if (strength <= 50) {
			if (internet === AstalNetwork.Internet.DISCONNECTED) {
				return '󰤣';
			} else if (internet === AstalNetwork.Internet.CONNECTED) {
				return '󰤢';
			} else if (internet === AstalNetwork.Internet.CONNECTING) {
				return '󰤤';
			}
		} else if (strength <= 75) {
			if (internet === AstalNetwork.Internet.DISCONNECTED) {
				return '󰤦';
			} else if (internet === AstalNetwork.Internet.CONNECTED) {
				return '󰤥';
			} else if (internet === AstalNetwork.Internet.CONNECTING) {
				return '󰤧';
			}
		} else {
			if (internet === AstalNetwork.Internet.DISCONNECTED) {
				return '󰤩';
			} else if (internet === AstalNetwork.Internet.CONNECTED) {
				return '󰤨';
			} else if (internet === AstalNetwork.Internet.CONNECTING) {
				return '󰤪';
			}
		}

		return '󰤯';
	}

	// Default or unknown status
	return '󰤮';
}
