import app from "ags/gtk4/app";
import { Astal, Gtk, Gdk } from "ags/gtk4";
import Clock from "./components/Clock";
import NotificationButton from "./components/NotificationButton";
import PowerButton from "./components/PowerButton";
import QuickSettingsPanel from "./components/QuickSettingsPanel";
import Workspaces from "./components/Workspaces";

export default function Bar(gdkmonitor: Gdk.Monitor) {
	const { BOTTOM, LEFT, RIGHT } = Astal.WindowAnchor;

	return (
		<window
			visible
			name="bar"
			class="Bar"
			gdkmonitor={gdkmonitor}
			exclusivity={Astal.Exclusivity.EXCLUSIVE}
			anchor={BOTTOM | LEFT | RIGHT}
			application={app}
		>
			<centerbox cssName="centerbox">
				<box $type="start">
					<PowerButton />
					<Workspaces />
				</box>
				<box $type="end" spacing={6}>
					<QuickSettingsPanel />
					<Clock />
					<NotificationButton />
				</box>
			</centerbox>
		</window>
	);
}
