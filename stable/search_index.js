var documenterSearchIndex = {"docs":
[{"location":"#JsonDB-1","page":"JsonDB","title":"JsonDB","text":"","category":"section"},{"location":"#","page":"JsonDB","title":"JsonDB","text":"(Image: Build Status) (Image: ) (Image: )","category":"page"},{"location":"#","page":"JsonDB","title":"JsonDB","text":"JsonDB is a lightweight and simple key-value store written in Julia, heavily inspired by Python's PickleDB","category":"page"},{"location":"#","page":"JsonDB","title":"JsonDB","text":"","category":"page"},{"location":"#Example-1","page":"JsonDB","title":"Example","text":"","category":"section"},{"location":"#","page":"JsonDB","title":"JsonDB","text":"julia> using JsonDB\n\njulia> const d = JsonDB\n\njulia> db = d.load(\"test.db\", false)\nMain.JsonDB.Database(Dict{Any,Any}(), nothing, \"test.db\", false)\n\njulia> d.set(db, \"fizz\", \"buzz\")\ntrue\n\njulia> d.get(db, \"fizz\")\n\"buzz\"\n\njulia> d.dump(db)\ntrue","category":"page"},{"location":"#Index-1","page":"JsonDB","title":"Index","text":"","category":"section"},{"location":"#","page":"JsonDB","title":"JsonDB","text":"","category":"page"},{"location":"#Functions-1","page":"JsonDB","title":"Functions","text":"","category":"section"},{"location":"#","page":"JsonDB","title":"JsonDB","text":"Modules = [JsonDB]","category":"page"},{"location":"#JsonDB.Database","page":"JsonDB","title":"JsonDB.Database","text":"JsonDB.Database\n\nThis type holds instance of database\n\n\n\n\n\n","category":"type"},{"location":"#Base.haskey-Tuple{Database,Any}","page":"JsonDB","title":"Base.haskey","text":"Base.haskey(db::Database, key)\n\nReturns true if key is present in the database else returns false\n\n\n\n\n\n","category":"method"},{"location":"#Base.length","page":"JsonDB","title":"Base.length","text":"Base.length(db::Database, name=nothing)\n\nReturns total number of key/value pairs in the database if name is nothing else returns length of the value with key name\n\n\n\n\n\n","category":"function"},{"location":"#JsonDB.append-Tuple{Database,Any,Any}","page":"JsonDB","title":"JsonDB.append","text":"JsonDB.append(db::Database, key, more)\n\nAdds more to keys's value\n\n\n\n\n\n","category":"method"},{"location":"#JsonDB.append-Tuple{Database,String,Integer,Any}","page":"JsonDB","title":"JsonDB.append","text":"JsonDB.append(db::Database, name::String, pos::Integer, more)\n\nAppends more to value at index pos in array with label name\n\n\n\n\n\n","category":"method"},{"location":"#JsonDB.append_array-Tuple{Database,String,Any}","page":"JsonDB","title":"JsonDB.append_array","text":"JsonDB.append_array(db::Database, name::String, seq)\n\nAppends more to the array with label name\n\n\n\n\n\n","category":"method"},{"location":"#JsonDB.create_array-Tuple{Database,String}","page":"JsonDB","title":"JsonDB.create_array","text":"JsonDB.create_array(db::Database, name::String)\n\nCreate an array as key with label name\n\n\n\n\n\n","category":"method"},{"location":"#JsonDB.create_dict-Tuple{Database,String}","page":"JsonDB","title":"JsonDB.create_dict","text":"JsonDB.create_dict(db::Database, name::String)\n\nCreates a dictionary with label name\n\n\n\n\n\n","category":"method"},{"location":"#JsonDB.delete-Tuple{Database,Any}","page":"JsonDB","title":"JsonDB.delete","text":"JsonDB.delete(db::Database, key)\n\nDeletes key from the database\n\n\n\n\n\n","category":"method"},{"location":"#JsonDB.delete_array-Tuple{Any,String}","page":"JsonDB","title":"JsonDB.delete_array","text":"JsonDB.delete_array(db::Database, name::String)\n\nDeletes array with key/label name from the database\n\n\n\n\n\n","category":"method"},{"location":"#JsonDB.delete_dict-Tuple{Database,String}","page":"JsonDB","title":"JsonDB.delete_dict","text":"JsonDB.delete_dict(db::Database, name::String)\n\nDeletes dictionary with label name and all of its keys\n\n\n\n\n\n","category":"method"},{"location":"#JsonDB.delete_value-Tuple{Any,String,Any}","page":"JsonDB","title":"JsonDB.delete_value","text":"JsonDB.delete_value(db::Database, name::String, value)\n\nDeletes value from array with label name\n\n\n\n\n\n","category":"method"},{"location":"#JsonDB.deletedb-Tuple{Database}","page":"JsonDB","title":"JsonDB.deletedb","text":"JsonDB.deletedb(db::Database)\n\nDeletes everyhing from the database db\n\n\n\n\n\n","category":"method"},{"location":"#JsonDB.dump-Tuple{Database}","page":"JsonDB","title":"JsonDB.dump","text":"JsonDB.dump(db::Database)\n\nForce dump databse to memory\n\n\n\n\n\n","category":"method"},{"location":"#JsonDB.get-Tuple{Database,Any}","page":"JsonDB","title":"JsonDB.get","text":"JsonDB.get(db::Database, key)\n\nGet value of the key\n\n\n\n\n\n","category":"method"},{"location":"#JsonDB.get-Tuple{Database,String,Integer}","page":"JsonDB","title":"JsonDB.get","text":"JsonDB.get(db::Database, name::String, pos::Integer)\n\nReturns value at pos from an array with label name\n\n\n\n\n\n","category":"method"},{"location":"#JsonDB.getall-Tuple{Database}","page":"JsonDB","title":"JsonDB.getall","text":"JsonDB.getall(db::Database)\n\nReturns iterator over all keys in the database\n\n\n\n\n\n","category":"method"},{"location":"#JsonDB.haskey-Tuple{Database,String,Any}","page":"JsonDB","title":"JsonDB.haskey","text":"JsonDB.haskey(db::Database, name::String, key)\n\nChecks whether key is in dictionary with label name\n\n\n\n\n\n","category":"method"},{"location":"#JsonDB.hasvalue-Tuple{Database,String,Any}","page":"JsonDB","title":"JsonDB.hasvalue","text":"JsonDB.hasvalue(db::Database, name::String, value)\n\nReturns true if value is present in array with label name else returns false\n\n\n\n\n\n","category":"method"},{"location":"#JsonDB.keys-Tuple{Database,String}","page":"JsonDB","title":"JsonDB.keys","text":"JsonDB.keys(db::Database, name::String)\n\nReturns iterator over all the keys in dictionary with label name\n\n\n\n\n\n","category":"method"},{"location":"#JsonDB.load","page":"JsonDB","title":"JsonDB.load","text":"JsonDB.load(path::String, auto_dump::Bool)\n\nReturns a Database object which is stored at path. Flag auto_dump determines whether to dump the databse to disk after every set(write), update and delete operation.\n\n\n\n\n\n","category":"function"},{"location":"#JsonDB.merge-Tuple{Database,String,String}","page":"JsonDB","title":"JsonDB.merge","text":"JsonDB.merge(db::Database, name1::String, name2::String)\n\nMerge the dictionary with label name2 into the dictionary with label name1. See the documentation for [Base.merge](https://docs.julialang.org/en/v1/base/collections/#Base.merge)\n\n\n\n\n\n","category":"method"},{"location":"#JsonDB.pop-Tuple{Database,Any,Any}","page":"JsonDB","title":"JsonDB.pop","text":"JsonDB.pop(db::Database, name::String, pos)\n\nIn case of array deletes the value at index posfrom array with label name In case of dictionary deletes the  value with key pos from dictionary with label name\n\n\n\n\n\n","category":"method"},{"location":"#JsonDB.range-Tuple{Database,String,Any,Any}","page":"JsonDB","title":"JsonDB.range","text":"JsonDB.range(db::Database, name::String, _start, _end)\n\nReturns slice from array with label name with starting index _start and ending index _end\n\n\n\n\n\n","category":"method"},{"location":"#JsonDB.set-Tuple{Any,Any,Any}","page":"JsonDB","title":"JsonDB.set","text":"JsonDB.set(db::Database, key, value)\n\nInsert key-value pair into the database\n\n\n\n\n\n","category":"method"},{"location":"#JsonDB.set_array-Tuple{Database,String,Any}","page":"JsonDB","title":"JsonDB.set_array","text":"JsonDB.set_array(db::Database, name::String, value)\n\nAdds value to array with label name\n\n\n\n\n\n","category":"method"},{"location":"#JsonDB.set_dict-Tuple{Database,String,Any}","page":"JsonDB","title":"JsonDB.set_dict","text":"JsonDB.set_dict(db::Database, name::String, pair)\n\nAdds a key/value pair to dictionary with label name. pair can be an array or tuple of length 2\n\n\n\n\n\n","category":"method"},{"location":"#JsonDB.values-Tuple{Database,String}","page":"JsonDB","title":"JsonDB.values","text":"`JsonDB.values(db::Database, name::String)\n\nReturns iterator over all the values in dictionary with label name\n\n\n\n\n\n","category":"method"}]
}
