push!(LOAD_PATH,"../src/")
using Documenter, JsonDB

makedocs(;
		 modules=[JsonDB],
		 sitename="JsonDB.jl",
		 authors="Amey Narkhede",
		 )

deploydocs(
    repo = "github.com/glitzflitz/JsonDB.jl.git",
	target="build",
	latest = "master",
)


