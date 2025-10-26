import AstalNetwork from "gi://AstalNetwork";
import { createBinding, createComputed } from "ags";
import { Gtk } from "ags/gtk4";
import { getNetworkIcon, getNetworkStrength } from "../utils/network";

export default function NetworkIndicator(props: { withValue: boolean }) {
	const network = AstalNetwork.get_default();

	let computedNetwork;

	// TODO: It's always not null I believe
	if (network.wifi !== null) {
		computedNetwork = createComputed([
			createBinding(network, "connectivity"),
			createBinding(network.wifi, "strength"),
			createBinding(network, "primary")
		]); 
	} else {
		computedNetwork = createComputed([
			createBinding(network, "connectivity"),
			createBinding(network, "primary")
		]);
	}

	return (
		<box orientation={Gtk.Orientation.VERTICAL}>
			<label label={ computedNetwork(() => getNetworkIcon(network)) } css="font-size: 22px; font-family: Hack NerdFont Mono" />
			{ props.withValue ? <label label={ computedNetwork(() => getNetworkStrength(network)) } css="font-size: 12px; margin-top: -4px" /> : "" }
		</box>
	);
}
