return {
	LuaVersion = "LuaU",
	VarNamePrefix = "",
	NameGenerator = "MangledShuffled",
	PrettyPrint = false,
	Seed = 0,
	Steps = {
		{ Name = "EncryptStrings", Settings = {} },
		{
			Name = "ConstantArray",
			Settings = { Threshold = 1, StringsOnly = true, Shuffle = true, Rotate = true, LocalWrapperThreshold = 0 },
		},
		{ Name = "WrapInFunction", Settings = {} },
	},
}
