push!(LOAD_PATH,"../src/")
using Documenter, JsonDB

makedocs(;
		 modules=[JsonDB]
		 sitename="JsonDB",
		 authors="Amey Narkhede",
		 )

deploydocs(
    repo = "https://github.com/glitzflitz/JsonDB.jl.git",
    target = "build"
)


