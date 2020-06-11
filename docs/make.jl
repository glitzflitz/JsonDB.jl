push!(LOAD_PATH,"../src/")
using Documenter, JsonDB

makedocs(;
		 modules=[JsonDB],
		 sitename="JsonDB",
		 authors="Amey Narkhede",
		 )

deploydocs(
    repo = "github.com/glitzflitz/JsonDB.jl.git",
	target="build",
	devurl = "dev",
	versions = ["stable" => "v^", "v#.#", devurl => devurl],
)


