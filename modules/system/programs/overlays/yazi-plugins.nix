final: prev:
{
	yaziPlugins = prev.yaziPlugins // {
		relative-motions = prev.yaziPlugins.relative-motions.overrideAttrs {
			src = prev.fetchFromGitHub {
				owner = "Jormala";
				repo = "relative-motions.yazi";
				rev = "d4f2003b90a6129847e17107df76ba43091c7755";
				hash = "sha256-lyzwbs1u4qXuIamE31QAD6e22RPJxROs7Q/tuTkz12Q=";
			};
		};

		compress = prev.yaziPlugins.mkYaziPlugin (finalAttrs: {
			pname = "compress.yazi";
			version = "0.7.0";

			src = prev.fetchFromGitHub {
				owner = "KKV9";
				repo = "compress.yazi";
				rev = "80e5268ec74c7ac17d4d739e13a9958cba4c70d3";
				hash = "sha256-9cdA8D/TtwHcLqrtoyIixA0YJmTs+c8FSNrjxp8CYI0=";
			};

			# sourceRoot = "source/easyjump.yazi";
		});
	};
}
