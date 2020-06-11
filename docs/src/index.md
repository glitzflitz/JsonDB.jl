# JsonDB.jl documentation

```@contents
```

## Index

```@index
```

## Functions

```@docs
JsonDB.load(path::String, auto_dump::Bool)
JsonDB.dump(db::Database)
JsonDB.set(db::Database, key, value)
JsonDB.get(db::Database, key)
JsonDB.get(db::Database, name::String, pos::Integer)
JsonDB.getall(db::Database)
Base.haskey(db::Database, key)
JsonDB.hasvalue(db::Database, name::String, value)
JsonDB.haskey(db::Database, name::String, key)
JsonDB.delete(db::Database, key)
Base.length(db::Database, name=nothing)
JsonDB.append(db::Database, key, more)
JsonDB.append(db::Database, name::String, pos::Integer, more)
JsonDB.append_array(db::Database, name::String, seq)
JsonDB.create_array(db::Database, name::String)
JsonDB.create_dict(db::Database, name::String)
JsonDB.set_array(db::Database, name::String, value)
JsonDB.set_dict(db::Database, name::String, pair)
JsonDB.range(db::Database, name::String, _start, _end)
JsonDB.delete_array(db::Database, name::String)
JsonDB.delete_value(db::Database, name::String, value)
JsonDB.delete_dict(db::Database, name::String)
JsonDB.pop(db::Database, name::String, pos)
JsonDB.keys(db::Database, name::String)
JsonDB.values(db::Database, name::String
JsonDB.merge(db::Database, name1::String, name2::String)
JsonDB.deletedb(db::Database)
```

