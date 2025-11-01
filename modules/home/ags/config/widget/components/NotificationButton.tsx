import { Astal, Gtk, Gdk } from "ags/gtk4";
// import Notifd from "gi://AstalNotifd";

export default function NotificationButton() {
	// const notifications = Notifd.get_default();

	return (
		<button has_frame={false} class="notification-button flat">
			<label label="" />
		</button>
	);
}
