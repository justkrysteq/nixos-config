import AstalBattery from "gi://AstalBattery";
import { createBinding, createComputed } from "ags";
import { Gtk } from "ags/gtk4";
import { getBatteryIcon, getBatteryPercentage } from "../utils/battery";

export default function BatteryIndicator(props: { withValue: boolean }) {
	const battery = AstalBattery.get_default();

	const computedBattery = createComputed([
		createBinding(battery, "percentage"),
		createBinding(battery, "state")
	]);

	return (
		<box visible={createBinding(battery, "isBattery")} orientation={Gtk.Orientation.VERTICAL}>
			<label label={computedBattery(() => getBatteryIcon(battery))} css="font-size: 22px; font-family: Hack NerdFont Mono" />
			{ props.withValue ? <label label={computedBattery(() => getBatteryPercentage(battery))} css="font-size: 12px; margin-top: -4px" /> : "" }
		</box>
	);
}

