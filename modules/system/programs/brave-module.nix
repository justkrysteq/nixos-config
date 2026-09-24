{ config, lib, pkgs, ... }:
let
	cfg = config.programs.brave;

	defaultProfile = filterAttrs (_: v: v != null) {
		ExtensionInstallForcelist = cfg.extensions;
		DefaultSearchProviderEnabled = cfg.searchProviders.default.enable;
		DefaultSearchProviderSearchURL = cfg.searchProviders.default.searchUrl;
		DefaultSearchProviderSuggestURL = cfg.searchProviders.default.suggestUrl;
		SiteSearchSettings = cfg.searchProviders.siteSearch;
	};

	braveEtcConfig = {
		# Managed (enterprise) policy files
		"brave/policies/managed/default.json" = mkIf (defaultProfile != { }) {
			text = builtins.toJSON defaultProfile;
		};

		"brave/policies/managed/extra.json" = mkIf (cfg.policies != { }) { # Brave handles this as an overwrite to the above
			text = builtins.toJSON cfg.policies;
		};
	};

	packageWithPrefs = cfg.package.overrideAttrs (old: {
		postInstall = (old.postInstall or "") + ''
			install -Dm644 ${pkgs.writeText "initial_preferences" (builtins.toJSON cfg.initialPrefs)} \
			$out/opt/brave.com/${if cfg.package.pname == "brave" then "brave-browser" else cfg.package.pname}/initial_preferences
		'';
	});

	inherit (lib)
		types
		mkOption
		mkPackageOption
		mkEnableOption
		mkIf
		literalExpression
		mkMerge
		filterAttrs
	;
in
{
	options.programs.brave = {
		enable = mkEnableOption "the Brave web browser";

		package = mkPackageOption pkgs "brave" {
			default = "brave-origin";
			example = "brave";
		};

		extensions = mkOption {
			type = with types; nullOr (listOf str);
			default = null;
			description = ''
				List of Brave (Chromium-style) extensions to force-install.
				These work the same way as Chromium extensions: a Chrome Web Store ID,
				optionally followed by `;url-to-update-manifest.xml`.
			'';
		};

		searchProviders = {
			default = {
				enable = mkOption {
					type = types.nullOr types.bool;
					description = "Enable the default search provider.";
					default = null;
					example = true;
				};

				searchUrl = mkOption {
					type = types.nullOr types.str;
					description = "Brave default search provider url.";
					default = null;
					example = "https://search.brave.com/search?q={searchTerms}&source=desktop";
				};

				suggestUrl = mkOption {
					type = types.nullOr types.str;
					description = "Brave default search provider url for suggestions.";
					default = null;
					example = "https://search.brave.com/api/suggest?q={searchTerms}&rich=true&source=desktop";
				};
			};

			siteSearch = mkOption {
				type = types.nullOr (types.listOf (types.submodule {
					options = {
						name = mkOption {
							type = types.str;
							description = "Display name of the search engine.";
							example = "Nix Packages";
						};

						shortcut = mkOption {
							type = types.str;
							description = "Shortcut used to trigger the search engine.";
							example = ":np";
						};

						url = mkOption {
							type = types.str;
							description = "Search URL. Must contain the {searchTerms} placeholder.";
							example = "https://search.nixos.org/packages?query={searchTerms}";
							apply = value:
								if lib.hasInfix "{searchTerms}" value then
									value
								else
									throw "siteSearch URLs must contain the {searchTerms} placeholder";
						};
					};
				}));

				default = null;

				description = ''
					Custom site-search definitions.
				'';

				example = literalExpression ''
					[
						{
							name = "Nix Packages";
							shortcut = ":np";
							url = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}";
						}
						{
							name = "Nix Options";
							shortcut = ":no";
							url = "https://search.nixos.org/options?channel=unstable&query={searchTerms}";
						}
						{
							name = "Home Manager";
							shortcut = ":hm";
							url = "https://home-manager-options.extranix.com/?query={searchTerms}&release=master";
						}
						{
							name = "YouTube";
							shortcut = ":yt";
							url = "https://www.youtube.com/results?search_query={searchTerms}";
						}
					]
				'';
			};
		};

		policies = mkOption {
			type = types.attrs;
			default = { };
			description = ''
				Additional Brave Enterprise policy settings.
				These follow the same format as Chromium policies:
				<https://support.brave.app/hc/en-us/articles/360039248271-Group-Policy>
			'';
			example = literalExpression ''
				{
					SyncDisabled = true;
					MetricsReportingEnabled = false;
					BraveRewardsDisabled = false;
				};
			'';
		};

		initialPrefs = mkOption {
			type = types.attrs;
			default = { };
			description = ''
				Initial preferences are used to configure the browser for the first run.
				Unlike {option}`programs.brave.policies`, initialPrefs can be changed by users in the browser settings.
				More information can be found in the Chromium documentation:
				<https://www.chromium.org/administrators/configuring-other-preferences/>
			'';
			example = literalExpression ''
				{
					containers.enabled = true;
					enable_window_closing_confirm = false;
					has_seen_brave_welcome_page = true;
				};
			'';
		};

	};

	config = mkIf cfg.enable {
		environment = {
			etc = braveEtcConfig;
			systemPackages = [
				(mkMerge [
					(mkIf (cfg.initialPrefs == { }) cfg.package)
					(mkIf (cfg.initialPrefs != { }) packageWithPrefs)
				])
			];
		};
	};
}
