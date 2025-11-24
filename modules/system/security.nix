{ pkgs, ... }:

{
	security = {

		wrappers = {
			# Allow btop to monitor the GPU DOES NOT WORK ATM
			btop = {
				source = "${pkgs.btop}/bin/btop";
				capabilities = "cap_perfmon=+ep";
			};
		};
	};
}
