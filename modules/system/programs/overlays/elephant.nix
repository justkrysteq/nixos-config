final: prev:
{
	elephant = prev.elephant.override {
		enabledProviders = [ "calc" "desktopapplications" "providerlist" ];
	};
}
