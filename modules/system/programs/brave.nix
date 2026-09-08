{ ... }:

{
	programs.chromium = {
		enable = true;

		defaultSearchProviderEnabled = true;
		defaultSearchProviderSearchURL = "https://search.brave.com/search?q={searchTerms}&source=desktop";
		defaultSearchProviderSuggestURL = "https://search.brave.com/api/suggest?q={searchTerms}&rich=true&source=desktop";

		extensions = [
			"eimadpbcbfnmbkopoojfekhnkhdbieeh;https://clients2.google.com/service/update2/crx" # Dark Reader
			"dbepggeogbaibhgnhhndojpepiihcmeb;https://clients2.google.com/service/update2/crx" # Vimium
		];
	};
}
