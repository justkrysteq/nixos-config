import Hyprland from "gi://AstalHyprland";
import { createBinding, createComputed, With } from "gnim";
import { Gtk } from "ags/gtk4";
import { Variable } from "../utils/Variable";

function groupByMonitor(array: Hyprland.Workspace[]): Hyprland.Workspace[][] {
	const map = new Map<Hyprland.Monitor, Hyprland.Workspace[]>();

	array.sort((a, b) => {
		if (a.id === 0 || b.id === 0) {
			return -1;
		}
		
		return a.monitor.id - b.monitor.id;
	});

	array.forEach((item) => {
		const key = item.monitor;
		
		if (key === null) {
			return;
		}

		if (!map.has(key)) {
			map.set(key, []);
		}

		map.get(key)!.unshift(item);
	});

	// Remove special:minimized workspaces  TODO: Handle this later
	map.forEach((value, key) => {
		value.forEach((item) => {
			if (item.name === "special:minimized") {
				value.splice(value.indexOf(item), 1);
			}
		});
	});

	return Array.from(map.values());
}


export default function Workspaces() {
	const hyprland = Hyprland.get_default();
	const workspaces = createBinding(hyprland, "workspaces");

	const activeClassAccessor = new Variable<string>("active").asAccessor();
	const inactiveClassAccessor = new Variable<string>("inactive").asAccessor();

	return (
		<With value={workspaces}>
			{(workspaces) => {
				const groupedWorkspaces = groupByMonitor(workspaces);
				
				return <box class="workspaces">
					{groupedWorkspaces.map((workspacesInMonitor, monitorIndex) => {
						return <box>
							{workspacesInMonitor.sort((a, b) => {
								return a.id - b.id
							}).map((workspace: Hyprland.Workspace) => {
								const workspaceClass = createComputed([
									createBinding(workspace.monitor, "activeWorkspace"),
									activeClassAccessor,
									inactiveClassAccessor
								], (w: Hyprland.Workspace, activeClass, inactiveClass) => {
									const active = w.id === workspace.id;
									return active ? activeClass : inactiveClass;
								});

								return <button
									onClicked={() => {
										if (workspace.monitor.activeWorkspace.id !== workspace.id) {
											hyprland.dispatch("workspace", workspace.id.toString());
										}
									}} >
										<box class={ workspaceClass } valign={Gtk.Align.CENTER} />
									</button>
							})}
						</box>
					})}
				</box>
			}}
		</With>
	);
}
