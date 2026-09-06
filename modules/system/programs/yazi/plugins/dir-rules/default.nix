{ pkgs, lib, ... }:
let
	fs = lib.fileset;
in
pkgs.yaziPlugins.mkYaziPlugin {
	pname = "dir-rules.yazi";
	version = "1.0.0";

	src = fs.intersection
		(fs.gitTracked ./.)
		(fs.fileFilter (file: file.hasExt "lua"))
	;

	meta = {
		description = "Yazi plugin for setting directory rules";
		license = lib.licenses.mit;
		maintainers = with lib.maintainers; [
			justkrysteq
		];
	};
}
