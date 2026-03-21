import Hyprland from "gi://AstalHyprland";
import { createBinding, createComputed, With } from "ags";
import { Variable } from "../utils/Variable";

export default function DiscordNotifications(props: { withValue: boolean }) {
	const hyprland = Hyprland.get_default();
	const clients = createBinding(hyprland, "clients");
	const iconAccessor = new Variable<string>("   ").asAccessor();

	return (
		<With value={clients}>
			{(clients) => {
				let client: Hyprland.Client | undefined = clients.find(client => {
					return client.get_title().includes("Discord | ");
				});

				if (client === undefined) {
					return
				}

				let binding = createBinding(client, "title");

				let isVisible = createComputed([binding], (title: string) => {
					return title.startsWith("(") || title.startsWith("• ");
				});

				let iconWithCount = createComputed([binding, iconAccessor], (title, icon) => {
					if (title.startsWith("(")) {
						if (title[2] !== ")") {
							return icon+title.substring(1, 3);
						}

						return icon+title[1];
					}
					if (title.startsWith("• ")) {
						return icon+title[0];
					}
					return "";
				});

				return <button label={props.withValue ? iconWithCount : ""} visible={isVisible} css="font-size: 20px; font-family: Hack NerdFont Proto;" onClicked={
					() => {
						client.focus();
					}
				} />
			}}
		</With>
	);
}
