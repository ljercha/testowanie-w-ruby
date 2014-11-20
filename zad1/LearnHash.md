Learn Hash in X minutes
=========
In Ruby
----

Version
----

```sh
ruby 2.1.3
```
Get the [code]
-----------

```ruby

# Hashes are Ruby's primary dictionary with keys/value pairs.
hash = { 'animal' => 'cat','shoeSize' => 6}

# To get array of keys
hash.keys #=> ['animal', 'shoeSize']
# and values
hash.values #=> ['cat', 6]
puts hash.class

# Hashes can be quickly looked up by key:
hash['animal'] #=> 'cat'
hash['shoeSize'] #=> 5
# and by value
hash.key('cat') #=> animal
hash.key(6) #=> shoeSize


# Asking a hash for a key that doesn't exist returns nil:
hash['cookie'] #=> nil
# buy you can change it to some value
hash.default = 'unknown'
hash['frog'] # => unknown


# You can search through the hash by using assoc method
h = {"colors"  => ["red", "blue", "green"],
     "letters" => ["a", "b", "c" ],
     "digits" => [0,1,2,3]}

h.assoc("letters")  #=> ["letters", ["a", "b", "c"]]
h.assoc("foo")      #=> nil


# To delete key/value you can use delete method
h.delete("colors") # => h = {"letters" => ["a", "b", "c" ], "digits" => [0,1,2,3]}

#Associates the value given by value with the key given by key.

h = { "a" => 100, "b" => 200 }
h["a"] = 9
h["c"] = 4
h   #=> {"a"=>9, "b"=>200, "c"=>4}
h.store("d", 42) #=> {"a"=>9, "b"=>200, "c"=>4, "d"=>42}

# Convert hash to two dimention array
h = { "zero" => 0, "one" => 1, "two" => 2, "three" => 3}
h.to_a   #=> [["c", 300], ["a", 100], ["d", 400]]

# To get size of the hash
h = { "d" => 100, "a" => 200, "v" => 300, "e" => 400 }
h.length        #=> 4
h.delete("a")   #=> 200
h.length        #=> 3

# Merge hashes
h1 = { "a" => 100, "b" => 200 }
h2 = { "b" => 254, "c" => 300 }
h1.merge(h2)  #=> {"a"=>100, "b"=>254, "c"=>300}

# Going through hashes
h = { "a" => 100, "b" => 200 }
h.each {|key, value| puts "#{key} is #{value}" }

# Convert to one dimention array (recursion level)
a =  {1=> "one", 2 => [2,"two"], 3 => "three"}
a.flatten    # => [1, "one", 2, [2, "two"], 3, "three"]
a.flatten(2) # => [1, "one", 2, 2, "two", 3, "three"]

# Invert hash with value-key
h = { "n" => 100, "m" => 100, "y" => 300, "d" => 200, "a" => 0 }
h.invert   #=> {0=>"a", 100=>"m", 200=>"d", 300=>"y"}

# Select hash by condition
h = { "zero" => 0, "one" => 1, "two" => 2, "three" => 3}
h.select {|k,v| v >= 2 }  #=> {"two" => 2, "three" => 3}

# Checking if hash got value
h = { "one" => 1, "two" => 2 }
h.has_value?(100)   #=> true
h.has_value?(999)   #=> false
```

[code]:http://pastebin.com/Pw2P1qUA
