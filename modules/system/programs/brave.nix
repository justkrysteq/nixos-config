{ ... }:

{
	programs.brave = {
		enable = true;

		extensions = [
			"eimadpbcbfnmbkopoojfekhnkhdbieeh;https://clients2.google.com/service/update2/crx" # Dark Reader
			"dbepggeogbaibhgnhhndojpepiihcmeb;https://clients2.google.com/service/update2/crx" # Vimium
		];

		searchProviders = {
			default = {
				enable = true;
				searchUrl = "https://search.brave.com/search?q={searchTerms}&source=desktop";
				suggestUrl = "https://search.brave.com/api/suggest?q={searchTerms}&rich=true&source=desktop";
			};

			siteSearch = [
				{ name = "Nix Packages"; shortcut = ":np"; url = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}"; }
				{ name = "Nix Options"; shortcut = ":no"; url = "https://search.nixos.org/options?channel=unstable&query={searchTerms}"; }
				# { name = "Home Manager"; shortcut = ":hm"; url = "https://home-manager-options.extranix.com/?query={searchTerms}&release=master"; }
				{ name = "Home Manager"; shortcut = ":hm"; url = "https://search.nixos.org/options?channel=unstable&query={searchTerms}&source=home_manager"; }
				{ name = "YouTube"; shortcut = ":yt"; url = "https://www.youtube.com/results?search_query={searchTerms}"; }
				{ name = "SoundCloud"; shortcut = ":sc"; url = "https://soundcloud.com/search?q={searchTerms}"; }
				{ name = "Google Translate"; shortcut = ":tr"; url = "https://translate.google.com/?source=osdd&sl=auto&tl=auto&text={searchTerms}&op=translate"; }
			];
		};

		policies = {
			BookmarkBarEnabled = false;
			EditBookmarksEnabled = false;
			RestoreOnStartup = 5;
			PaymentMethodQueryEnabled = false;
			PasswordManagerEnabled = false;
			ShowHomeButton = false;
			AllowedLanguages = [ "en-US" "en" "pl" ];
			ForcedLanguages = [ "en-US" "en" "pl" ];
			SpellcheckEnabled = true;
			SpellcheckLanguage = [ "en-US" "pl" ];
			AutofillAddressEnabled = false;
			AutofillCreditCardEnabled = false;
			AutofillPredictionSettings = 2;
		};

		initialPrefs = {
			containers.enabled = true;

			enable_window_closing_confirm = false;

			has_seen_brave_welcome_page = true;

			tabs = {
				vertical_tabs_enabled = true;
				vertical_tabs_collapsed = true;
			};

			browser = {
				custom_chrome_frame = false;
				pin_split_tab_button = false;
			};

			enable_do_not_track = true;

			extensions.settings = {
				dbepggeogbaibhgnhhndojpepiihcmeb.incognito = true;
				eimadpbcbfnmbkopoojfekhnkhdbieeh.incognito = true;
			};

			translate_blocked_languages = [ "en" "pl" ];
		};
	};
}

