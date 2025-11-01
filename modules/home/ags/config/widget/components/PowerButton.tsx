import { Astal, Gtk, Gdk } from "ags/gtk4";
import { execAsync } from "ags/process";

export default function PowerButton() {
// <image file={"assets/nixos-violet.png"} pixelSize={24} /> 
	return (
		<button halign={Gtk.Align.CENTER} has_frame={false} class="power-button flat"
			onClicked={() => execAsync("echo hello").then(console.log)}
		>
			<label label="" />
		</button>
	);
}
