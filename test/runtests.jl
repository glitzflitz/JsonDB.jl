using JsonDB
using Test

const d = JsonDB

@testset "JsonDB.jl" begin
	db = d.load("test.db", false)

	@test db !== nothing
	
	d.set(db, "fizz", "buzz")
	@test "buzz" == d.get(db, "fizz")
	@test "buzz" == db.db["fizz"]

	d.deletedb(db)
	d.set(db, "key1", "value1")
	d.set(db, "key2", "value2")
	d.create_dict(db, "dict1")
	d.create_array(db, "array1")
	output = d.getall(db)
	expected = collect(keys(Dict("key2"=>nothing, "key1"=>nothing, "dict1"=>nothing, "array1"=>nothing)))
	@test collect(output) == expected

	d.set(db, "key", "value")
	d.delete(db, "key")
	@test d.get(db, "key") == false

	d.set(db, "key", "value")
	d.append(db, "key", "value")
	@test d.get(db, "key") == "valuevalue"

	d.set(db, "key", "value")
	@test haskey(db, "key") == true
	d.delete(db, "key")
	@test haskey(db, "key") == false

	d.create_array(db, "list")
	d.set_array(db, "list", "one")
	d.set_array(db, "list", "two")
	d.set_array(db, "list", "three")
	d.set_array(db, "list", "four")
	@test d.range(db, "list", 2, 3) == ["two", "three"]
	d.delete_array(db, "list")

	d.create_dict(db, "dict")
	d.set_dict(db, "dict", "key" => "value")
	@test d.haskey(db, "dict", "key") == true
	d.delete_dict(db, "dict")

	d.create_dict(db, "dict")
	d.set_dict(db, "dict", "key" => "value")
	@test d.haskey(db, "dict", "absent_key") == false
	d.delete_dict(db, "dict")
end

