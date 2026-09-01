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

		# easyjump = prev.yaziPlugins.mkYaziPlugin (finalAttrs: {
		# 	pname = "easyjump.yazi";
		# 	version = "3.0.0";
		#
		# 	src = prev.fetchFromGitHub {
		# 		owner = "mikavilpas";
		# 		repo = "easyjump.yazi";
		# 		rev = "v${finalAttrs.version}";
		# 		hash = "sha256-ecrBur2bTV805WR5JS8xx01Fn/Y6JLwuZJK8Xvl2kgc=";
		# 	};
		#
		# 	sourceRoot = "source/easyjump.yazi";
		# });
	};
}
