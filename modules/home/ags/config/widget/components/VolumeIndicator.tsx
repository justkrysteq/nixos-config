import Wp from "gi://AstalWp";
import { createBinding, createComputed } from "ags";
import { Gtk } from "ags/gtk4";
import { getVolumeIcon, getVolumeValue } from "../utils/volume";

export default function VolumeIndicator(props: { withValue: boolean }) {
	const wp = Wp.get_default()
	const defaultSpeaker = wp.audio.default_speaker;

	const computedVolume = createComputed([
		createBinding(defaultSpeaker, "description"),
		createBinding(defaultSpeaker, "volume"),
		createBinding(defaultSpeaker, "mute")
	]);

	return (
		<box orientation={Gtk.Orientation.VERTICAL}>
			<label label={computedVolume(() => getVolumeIcon(defaultSpeaker))} css="font-size: 22px; font-family: Hack NerdFont Mono" />
			{ props.withValue ? <label label={computedVolume(() => getVolumeValue(defaultSpeaker))} css="font-size: 12px; margin-top: -4px" /> : "" }
		</box>
	);
}

