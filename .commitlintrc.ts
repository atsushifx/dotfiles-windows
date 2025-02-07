const Configuration = {
	/*
	 * Resolve and load @commitlint/config-conventional from node_modules.
	 * Referenced packages must be installed
	 */
	extends: ['@commitlint/config-conventional'],

	rules: {
		"type-enum": [2, "always", [
			"build",
			"chore",
			"docs",
			"feat",
			"fix",
			"refactor",
			"revert",
			"style",
			// added commit type
			"merge",
			"publish",
		]],
	},
};

export default Configuration

