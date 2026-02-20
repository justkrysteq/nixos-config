final: prev:
{
	elephant = prev.elephant.override {
		enableArchLinuxPkgs = false;
		enableDnfPackages = false;
		enable1password = false;
		enableBitwarden = false;
		enableBluetooth = false;
		enableBookmarks = false;
		enableCalc = true;
		enableClipboard = false;
		enableDesktopApplications = true;
		enableFiles = false;
		enableMenus = false;
		enableNiriActions = false;
		enableNiriSessions = false;
		enableProviderList = true;
		enableRunner = false;
		enableSnippets = false;
		enableSymbols = false;
		enableTodo = false;
		enableUnicode = false;
		enableWebsearch = false;
		enableWindows = false;
	};
}
