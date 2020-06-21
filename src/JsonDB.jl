module JsonDB

export Database
import Base.Threads.@spawn
import JSON3

"""
`JsonDB.Database`

This type holds instance of database
"""
mutable struct Database
	db::AbstractDict
	thread
	path::String
	auto_dump::Bool
	Database(path::String, auto_dump::Bool) = new(Dict(), nothing, path, auto_dump)
end

"""
`JsonDB.load(path::String, auto_dump::Bool)`

Returns a Database object which is stored at `path`. Flag `auto_dump` determines whether to dump the databse to disk after every set(write), update and delete operation.
"""
function load(path::String, auto_dump::Bool, sig=true)
	db = Database(path, auto_dump)
	_load(db, path, auto_dump)
	if sig
		set_sigterm_handler(db::Database)
	end
	return db
end


function set_sigterm_handler(db::Database)
	item = db
	function sigterm_handler()
	    if item.thread !== nothing
		     fetch(item.thread)
		exit(Base.SIGTERM)
	    end
	end
	atexit(sigterm_handler)
end

function _load(db::Database, path, auto_dump)
	path = expanduser(path)
	db.path = path
	db.auto_dump = auto_dump
	if ispath(path)
		_loaddb(db)
	else
		db.db = Dict()
	end
	return true
end

function _dump(db::Database)
	json = JSON3.write(db.db)
	open(db.path, "w") do file
		write(file, json)
	end
end

"""
`JsonDB.dump(db::Database)`

Force dump databse to memory
"""
function dump(db::Database)
	db.thread = @spawn _dump(db)
	fetch(db.thread)
	return true
end

function _loaddb(db::Database)
		file = open(db.path, "r")
	try
		db.db = JSON3.read(file, Dict)
	catch err
		if filesize(file) == 0
			db.db = Dict()
		elseif isa(err, JSON3.Error)
			throw(err)
		else
			error("Failed to read JSON")
		end
	end
end

function _autodump(db::Database)
	if db.auto_dump
		dump(db)
	end
end

"""
`JsonDB.set(db::Database, key, value)`

Insert key-value pair into the database
"""
function set(db, key, value)
	if isa(key, String)
		db.db[key] = value
		_autodump(db)
		return true
	else
		throw(error("key/name must be string"))
	end
end

"""
`JsonDB.get(db::Database, key)`

Get value of the `key`
"""
function get(db::Database, key)
	Base.get(db.db, key, false)
end

"""
`JsonDB.getall(db::Database)`

Returns iterator over all keys in the database
"""
function getall(db::Database)
	return Base.keys(db.db)
end

"""
`Base.haskey(db::Database, key)`

Returns `true` if `key` is present in the database else returns `false`
"""
function Base.haskey(db::Database, key)
	return Base.haskey(db.db, key)
end

"""
`JsonDB.delete(db::Database, key)`

Deletes `key` from the database
"""
function delete(db::Database, key)
	if !Base.haskey(db.db, key)
		return false
	end
	Base.delete!(db.db, key)
	_autodump(db)
	return true
end

"""
`Base.length(db::Database, name=nothing)`

Returns total number of key/value pairs in the database if `name` is `nothing` else returns length of the value with key `name`
"""
function Base.length(db::Database, name=nothing)
	if isnothing(name)
		total = length(db.db)
		return total
	else
		total = length(db.db[name])
		return total
	end
end

"""
`JsonDB.append(db::Database, key, more)`

Adds `more` to `keys`'s value
"""
function append(db::Database, key, more)
	tmp = db.db[key]
	db.db[key] = tmp * more
	_autodump(db)
	return true
end

"""
`JsonDB.create_array(db::Database, name::String)`

Create an array as key with label `name`
"""
function create_array(db::Database, name::String)
	if isa(name, String)
		db.db[name] = []
		_autodump(db)
		return true
	else
		throw(err("key/name must be string"))
	end
end

"""
`JsonDB.set_array(db::Database, name::String, value)`

Adds `value` to array with label `name`
"""
function set_array(db::Database, name::String, value)
	db.db[name] = vcat(db.db[name], value)
	_autodump(db)
	return true
end

"""
`JsonDB.append_array(db::Database, name::String, seq)`

Appends `more` to the array with label `name`
"""
function append_array(db::Database, name::String, seq)
	Base.push!(db.db[name], seq)
	_autodump(db)
	return true
end

"""
`JsonDB.get(db::Database, name::String, pos::Integer)`

Returns value at `pos` from an array with label `name`
"""
function get(db::Database, name::String, pos::Integer)
	return db.db[name][pos]
end

"""
JsonDB.range(db::Database, name::String, _start, _end)

Returns slice from array with label `name` with starting index `_start` and ending index `_end`
"""
function range(db::Database, name::String, _start, _end)
	return db.db[name][_start:_end]
end

"""
`JsonDB.delete_array(db::Database, name::String)`

Deletes array with key/label `name` from the database
"""
function delete_array(db, name::String)
	len = Base.length(db.db[name])
	Base.delete!(db.db , name)
	_autodump(db)
	return len
end

"""
`JsonDB.delete_value(db::Database, name::String, value)`

Deletes `value` from array with label `name`
"""
function delete_value(db, name::String, value)
	Base.delete!(db.db[name], value)
	_autodump(db)
	return true
end

"""
`JsonDB.pop(db::Database, name::String, pos)`

In case of array deletes the value at index `pos`from array with label `name`
In case of dictionary deletes the  value with key `pos` from dictionary with label `name`
"""
JsonDB.pop(db::Database, name, pos)
function pop(db, name, pos)
	value = pop(db.db[name], pos)
	_autodump(db)
	return value
end
"""
`JsonDB.append(db::Database, name::String, pos::Integer, more)`

Appends `more` to value at index `pos` in array with label `name`
"""
function append(db::Database, name::String, pos::Integer, more)
	tmp = db.db[name][pos]
	db.db[name][pos] = tmp + more
	_autodump(db)
	return true
end

"""
`JsonDB.hasvalue(db::Database, name::String, value)`

Returns `true` if `value` is present in array with label `name` else returns `false`
"""
function hasvalue(db::Database, name::String, value)
	return value in db.db[name]
end

"""
`JsonDB.create_dict(db::Database, name::String)`

Creates a dictionary with label `name`
"""
function create_dict(db::Database, name::String)
	if isa(name, String)
		db.db[name] = Dict()
		_autodump(db)
		return true;
	else
		throw(err("key/name must be string"))
	end
end

"""
`JsonDB.set_dict(db::Database, name::String, pair)`

Adds a key/value pair to dictionary with label `name`. `pair` can be an array or tuple of length 2
"""
function set_dict(db::Database, name::String, pair)
	db.db[name][pair[1]] = pair[2]
	JsonDB._autodump(db)
	return true
end

"""
`JsonDB.delete_dict(db::Database, name::String)`

Deletes dictionary with label `name` and all of its keys
"""
function delete_dict(db::Database, name::String)
	Base.delete!(db.db, name)
	_autodump(db)
	return true
end

"""
`JsonDB.haskey(db::Database, name::String, key)`

Checks whether `key` is in dictionary with label `name`
"""
function haskey(db::Database, name::String, key)
	return key in Base.collect(Base.keys(db.db[name]))
end


"""
`JsonDB.keys(db::Database, name::String)`

Returns iterator over all the keys in dictionary with label `name`
"""
function keys(db::Database, name::String)
	return Base.keys(self.db[name])
end

"""
`JsonDB.values(db::Database, name::String)

Returns iterator over all the values in dictionary with label `name`
"""
function values(db::Database, name::String)
	return Base.values(self.db[name])
end

"""
`JsonDB.merge(db::Database, name1::String, name2::String)`

Merge the dictionary with label `name2` into the dictionary with label `name1`.
See the documentation for `[Base.merge]`(https://docs.julialang.org/en/v1/base/collections/#Base.merge)
"""
function merge(db::Database, name1::String, name2::String)
	merge!(db.db[name1], db.db[name2])
	_autodump(db)
	return true
end

"""
`JsonDB.deletedb(db::Database)`

Deletes everyhing from the database `db`
"""
function deletedb(db::Database)
	db.db = Dict()
	_autodump(db)
	return true
end

end
