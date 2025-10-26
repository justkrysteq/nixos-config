import BatteryIndicator from "./BatteryIndicator";
import VolumeIndicator from "./VolumeIndicator";
import NetworkIndicator from "./NetworkIndicator";

export default function QuickSettingsPanel() {
	return (
		<box class="quick-settings-panel" cssName="box">
			<NetworkIndicator withValue={true} />
			<VolumeIndicator withValue={true} />
			<BatteryIndicator withValue={true} />
		</box>
	);
}
