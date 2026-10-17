return {
    LuaVersion = "LuaU",
    VarNamePrefix = "",
    NameGenerator = "MangledShuffled",
    PrettyPrint = false,
    Seed = 500697,
    Steps = {
        { Name = "AddVararg", Settings = {} },
        { Name = "ConstantArray", Settings = {
            Threshold = 1,
            StringsOnly = true,
            Shuffle = true,
            Rotate = true,
            LocalWrapperThreshold = 0,
            Encoding = "mixed",
        } },
        { Name = "WrapInFunction", Settings = {} },
    },
}
