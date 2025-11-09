{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		(brave.override {
			commandLineArgs = [
				"--disable-features=WaylandWpColorManagerV1"
			];
		})
	];

	programs.chromium = {
		enable = true;

		defaultSearchProviderEnabled = true;
		defaultSearchProviderSearchURL = "https://search.brave.com/search?q={searchTerms}&source=desktop";
		defaultSearchProviderSuggestURL = "https://search.brave.com/api/suggest?q={searchTerms}&rich=true&source=desktop";

		extensions = [
			"eimadpbcbfnmbkopoojfekhnkhdbieeh;https://clients2.google.com/service/update2/crx" # Dark Reader
		];

		initialPrefs = {
			bookmark_bar = {
				show_on_all_tabs = false;
				show_tab_groups = true;
			};

			brave = {
				accelerators = {
					"33000" = [
						"BrowserBack"
						"Alt+ArrowLeft"
						"AltGr+ArrowLeft"
					];
					
					"33001" = [
						"BrowserForward"
						"Alt+ArrowRight"
						"AltGr+ArrowRight"
					];
					
					"33002" = [
						"Control+KeyR"
						"F5"
						"BrowserRefresh"
					];
					
					"33003" = [
						"BrowserHome"
						"Alt+Home"
					];
					
					"33007" = [
						"Control+Shift+KeyR"
						"Control+F5"
						"Shift+F5"
						"Control+BrowserRefresh"
						"Shift+BrowserRefresh"
					];
					
					"34000" = [
						"Control+KeyN"
					];
					
					"34001" = [
						"Control+Shift+KeyN"
					];
					
					"34012" = [
						"Control+Shift+KeyW"
						"Alt+F4"
					];

					"34014" = [
						"AppNew"
						"Control+KeyT"
					];
					
					"34015" = [
						"Control+KeyW"
						"Control+F4"
						"AppClose"
					];
					
					"34016" = [
						"Control+Tab"
						"Control+PageDown"
					];
					
					"34017" = [
						"Control+Shift+Tab"
						"Control+PageUp"
					];
					
					"34018" = [
						"Control+Digit1"
						"Control+Numpad1"
						"Alt+Digit1"
						"Alt+Numpad1"
					];
					
					"34019" = [
						"Control+Digit2"
						"Control+Numpad2"
						"Alt+Digit2"
						"Alt+Numpad2"
					];
					
					"34020" = [
						"Control+Digit3"
						"Control+Numpad3"
						"Alt+Digit3"
						"Alt+Numpad3"
					];
					
					"34021" = [
						"Control+Digit4"
						"Control+Numpad4"
						"Alt+Digit4"
						"Alt+Numpad4"
					];
					
					"34022" = [
						"Control+Digit5"
						"Control+Numpad5"
						"Alt+Digit5"
						"Alt+Numpad5"
					];
					
					"34023" = [
						"Control+Digit6"
						"Control+Numpad6"
						"Alt+Digit6"
						"Alt+Numpad6"
					];
					
					"34024" = [
						"Control+Digit7"
						"Control+Numpad7"
						"Alt+Digit7"
						"Alt+Numpad7"
					];
					
					"34025" = [
						"Control+Digit8"
						"Control+Numpad8"
						"Alt+Digit8"
						"Alt+Numpad8"
					];
					
					"34026" = [
						"Control+Digit9"
						"Control+Numpad9"
						"Alt+Digit9"
						"Alt+Numpad9"
					];
					
					"34028" = [
						"Control+Shift+KeyT"
					];
					
					"34030" = [
						"F11"
					];
					
					"34032" = [
						"Control+Shift+PageDown"
					];
					
					"34033" = [
						"Control+Shift+PageUp"
					];
					
					"34047" = [];
					
					"34100" = [
						"Alt+Shift+KeyC"
					];
					
					"34101" = [
						"Alt+Shift+KeyP"
					];
					
					"34102" = [
						"Alt+Shift+KeyX"
					];
					
					"34103" = [
						"Alt+Shift+KeyZ"
					];
					
					"34104" = [
						"Alt+Shift+KeyW"
					];
					
					"35000" = [
						"Control+KeyD"
					];
					
					"35001" = [
						"Control+Shift+KeyD"
					];
					
					"35002" = [
						"Control+KeyU"
					];
					
					"35003" = [
						"Control+KeyP"
					];
					
					"35004" = [
						"Control+KeyS"
					];
					
					"35007" = [
						"Control+Shift+KeyP"
					];
					
					"35031" = [
						"Control+Shift+KeyS"
					];
					
					"37000" = [
						"Control+KeyF"
					];

					"37001" = [
						"Control+KeyG"
						"F3"
					];
					
					"37002" = [
						"Control+Shift+KeyG"
						"Shift+F3"
					];
					
					"37003" = [
						"Escape"
					];
					
					"38001" = [
						"Control+Equal"
						"Control+NumpadAdd"
						"Control+Shift+Equal"
					];
					
					"38002" = [
						"Control+Digit0"
						"Control+Numpad0"
					];
					
					"38003" = [
						"Control+Minus"
						"Control+NumpadSubtract"
						"Control+Shift+Minus"
					];
					
					"39000" = [
						"Alt+Shift+KeyT"
					];
					
					"39001" = [
						"Control+KeyL"
						"Alt+KeyD"
					];

					"39002" = [
						"BrowserSearch"
						"Control+KeyE"
						"Control+KeyK"
					];
					
					"39003" = [
						"F10"
						"AltGr"
						"Alt"
					];
					
					"39004" = [
						"F6"
					];
					
					"39005" = [
						"Shift+F6"
					];
					
					"39006" = [
						"Alt+Shift+KeyB"
					];
					
					"39007" = [
						"Alt+Shift+KeyA"
					];
					
					"39009" = [
						"Control+F6"
					];
					
					"40000" = [
						"Control+KeyO"
					];
					
					"40004" = [
						"Control+Shift+KeyI"
					];
					
					"40005" = [
						"Control+Shift+KeyJ"
					];
					
					"40009" = [
						"BrowserFavorites"
						"Control+Shift+KeyB"
					];
					
					"40010" = [
						"Control+KeyH"
					];
					
					"40011" = [
						"Control+Shift+KeyO"
					];
					
					"40012" = [
						"Control+KeyJ"
					];
					
					"40013" = [
						"Control+Shift+Delete"
					];
					
					"40019" = [
						"F1"
					];
					
					"40021" = [
						"Alt+KeyE"
						"Alt+KeyF"
					];
					
					"40023" = [
						"Control+Shift+KeyC"
					];
					
					"40134" = [
						"Control+Shift+KeyM"
					];
					
					"40237" = [
						"F12"
					];
					
					"40260" = [
						"F7"
					];
					
					"40286" = [
						"Shift+Escape"
					];
					
					"52500" = [
						"Control+Shift+KeyA"
					];
					
					"56003" = [
						"Alt+Shift+KeyN"
					];
					
					"56041" = [
						"Control+KeyM"
					];
					
					"56044" = [
						"Control+KeyB"
					];
					
					"56045" = [
						"Control+BracketRight"
					];
					
					"56215" = [
						"Control+Quote"
					];
					
					"56301" = [
						"Control+Space"
					];
					
					"56308" = [
						"Control+Semicolon"
					];
				};

				ai_chat = {
					autocomplete_provider_enabled = false;
					show_toolbar_button = false;
				};

				always_show_bookmark_bar_on_ntp = false;

				brave_private_new_tab = {
					private_window_disclaimer_dismissed = true;
				};

				brave_search = {
					last-used-ntp-search-engine = "search.brave.com";
					show-ntp-search = true;
				};
				
				enable_media_router_on_restart = true;
				enable_window_closing_confirm = false;
				has_seen_brave_welcome_page = true;

				new_tab_page = {
					clock_format = "24";
					show_background_image = true;
					show_branded_background_image = false;
					show_brave_news = false;
					show_clock = false;
					show_rewards = false;
					show_together = false;
					shows_options = 0;
				};

				rewards = {
					show_brave_rewards_button_in_location_bar = false;
				};

				show_bookmarks_button = false;
				show_side_panel_button = false;

				speedreader = {
					enabled_for_all_sites = true;
				};

				tabs = {
					hover_mode = 2;
					vertical_tabs_collapsed = true;
					vertical_tabs_enabled = true;
					vertical_tabs_expanded_state_per_window = true;
					vertical_tabs_on_right = false;
					vertical_tabs_show_scrollbar = false;
					vertical_tabs_show_title_on_window = false;
				};
		
				tabs_search_show = false;

				wallet = {
					show_wallet_icon_on_toolbar = false;
				};

				browser = {
					custom_chrome_frame = false;
					show_home_button = false;
				};

				custom_links = {
					initialized = true;
					list = [
						{
							isMostVisited = false;
							title = "Proton";
							url = "https://mail.proton.me/";
						}
						{
							isMostVisited = false;
							title = "SoundCloud";
							url = "https://soundcloud.com/krysteqofficial";
						}
						{
							isMostVisited = false;
							title = "YouTube";
							url = "https://youtube.com/";
						}
						{
							isMostVisited = false;
							title = "GitHub";
							url = "https://github.com/";
						}
						{
							isMostVisited = false;
							title = "NextDNS";
							url = "https://my.nextdns.io/374e98/setup";
						}
					];
				};

				enable_do_not_track = true;

				intl = {
					accept_languages = "en-US;en,pl";
					selected_languages = "en-US;en,pl";
				};

				spellcheck = {
					dictionaries = [
						"en-US"
						"pl"
					];
				};

			};
		};
	};
}
