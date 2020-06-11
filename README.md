# JsonDB

JsonDB is a lightweight and simple key-value store written in Julia, heavily inspired by [Python's PickleDB](https://pythonhosted.org/pickleDB/)

## Example
```julia
julia> using JsonDB

julia> const d = JsonDB

julia> db = d.load("test.db", false)
Main.JsonDB.Database(Dict{Any,Any}(), nothing, "test.db", false)

julia> d.set(db, "fizz", "buzz")
true

julia> d.get(db, "fizz")
"buzz"

julia> d.dump(db)
true
```



