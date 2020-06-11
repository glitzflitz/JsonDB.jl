push!(LOAD_PATH,"../src/")
using Documenter, JsonDB

makedocs(;
		 modules=[JsonDB],
		 format = Documenter.HTML(
		    canonical = "https://glitzflitz.github.io/JsonDB.jl/stable/",
		 ),

		 sitename="JsonDB.jl",
		 authors="Amey Narkhede",
		 )

deploydocs(
    repo = "github.com/glitzflitz/JsonDB.jl.git",
	target="build",
)


