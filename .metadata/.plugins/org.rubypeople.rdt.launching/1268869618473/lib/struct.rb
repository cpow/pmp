=begin
---------------------------------------------------------- Class: Struct
     A +Struct+ is a convenient way to bundle a number of attributes
     together, using accessor methods, without having to write an
     explicit class.

     The +Struct+ class is a generator of specific classes, each one of
     which is defined to hold a set of variables and their accessors. In
     these examples, we'll call the generated class ``_Customer_Class,''
     and we'll show an example instance of that class as
     ``_Customer_Inst.''

     In the descriptions that follow, the parameter _symbol_ refers to a
     symbol, which is either a quoted string or a +Symbol+ (such as
     +:name+).

------------------------------------------------------------------------


Includes:
---------
     Enumerable(all?, any?, collect, detect, each_cons, each_slice,
     each_with_index, each_with_object, entries, enum_cons, enum_slice,
     enum_with_index, find, find_all, grep, group_by, include?,
     index_by, inject, many?, map, max, member?, min, none?, partition,
     reject, select, sort, sort_by, sum, to_a, to_set, zip)


Class methods:
--------------
     new, new, yaml_new, yaml_tag_class_name, yaml_tag_read_class


Instance methods:
-----------------
     ==, [], []=, each, each_pair, eql?, hash, inspect, length, members,
     pretty_print, pretty_print_cycle, select, size, to_a, to_s,
     to_yaml, values, values_at

=end
class Struct < Object
  include Enumerable

  def self.yaml_tag_subclasses?
  end

  # ------------------------------------------------------- Struct::yaml_new
  #      Struct::yaml_new( klass, tag, val )
  # ------------------------------------------------------------------------
  #      (no description...)
  def self.yaml_new(arg0, arg1, arg2)
  end

  # -------------------------------------------- Struct::yaml_tag_read_class
  #      Struct::yaml_tag_read_class( name )
  # ------------------------------------------------------------------------
  #      (no description...)
  def self.yaml_tag_read_class(arg0)
  end

  # ------------------------------------------------------------ Struct::new
  #      Struct::new(...)
  # ------------------------------------------------------------------------
  #      (no description...)
  def self.new(arg0, arg1, *rest)
  end

  # -------------------------------------------- Struct::yaml_tag_class_name
  #      Struct::yaml_tag_class_name()
  # ------------------------------------------------------------------------
  #      (no description...)
  def self.yaml_tag_class_name
  end

  # ------------------------------------------------------------ Struct#eql?
  #      eql?(p1)
  # ------------------------------------------------------------------------
  #      code-seq:
  # 
  #        struct.eql?(other)   => true or false
  # 
  #      Two structures are equal if they are the same object, or if all
  #      their fields are equal (using +eql?+).
  # 
  def eql?
  end

  # ---------------------------------------------------------- Struct#values
  #      struct.to_a     => array
  #      struct.values   => array
  # ------------------------------------------------------------------------
  #      Returns the values for this instance as an array.
  # 
  #         Customer = Struct.new(:name, :address, :zip)
  #         joe = Customer.new("Joe Smith", "123 Maple, Anytown NC", 12345)
  #         joe.to_a[1]   #=> "123 Maple, Anytown NC"
  # 
  def values
  end

  def taguri=
  end

  # ------------------------------------------------------- Struct#values_at
  #      struct.values_at(selector,... )  => an_array
  # ------------------------------------------------------------------------
  #      Returns an array containing the elements in _self_ corresponding to
  #      the given selector(s). The selectors may be either integer indices
  #      or ranges. See also </code>.select<code>.
  # 
  #         a = %w{ a b c d e f }
  #         a.values_at(1, 3, 5)
  #         a.values_at(1, 3, 5, 7)
  #         a.values_at(-1, -3, -5, -7)
  #         a.values_at(1..3, 2...5)
  # 
  def values_at
  end

  # -------------------------------------------------------------- Struct#==
  #      struct == other_struct     => true or false
  # ------------------------------------------------------------------------
  #      Equality---Returns +true+ if _other_struct_ is equal to this one:
  #      they must be of the same class as generated by +Struct::new+, and
  #      the values of all instance variables must be equal (according to
  #      +Object#==+).
  # 
  #         Customer = Struct.new(:name, :address, :zip)
  #         joe   = Customer.new("Joe Smith", "123 Maple, Anytown NC", 12345)
  #         joejr = Customer.new("Joe Smith", "123 Maple, Anytown NC", 12345)
  #         jane  = Customer.new("Jane Doe", "456 Elm, Anytown NC", 12345)
  #         joe == joejr   #=> true
  #         joe == jane    #=> false
  # 
  def ==
  end

  # ------------------------------------------------------------ Struct#to_s
  #      struct.to_s      => string
  #      struct.inspect   => string
  # ------------------------------------------------------------------------
  #      Describe the contents of this struct in a string.
  # 
  def to_s
  end

  # ------------------------------------------------------------ Struct#size
  #      struct.length    => fixnum
  #      struct.size      => fixnum
  # ------------------------------------------------------------------------
  #      Returns the number of instance variables.
  # 
  #         Customer = Struct.new(:name, :address, :zip)
  #         joe = Customer.new("Joe Smith", "123 Maple, Anytown NC", 12345)
  #         joe.length   #=> 3
  # 
  def size
  end

  # ------------------------------------------------------------ Struct#each
  #      struct.each {|obj| block }  => struct
  # ------------------------------------------------------------------------
  #      Calls _block_ once for each instance variable, passing the value as
  #      a parameter.
  # 
  #         Customer = Struct.new(:name, :address, :zip)
  #         joe = Customer.new("Joe Smith", "123 Maple, Anytown NC", 12345)
  #         joe.each {|x| puts(x) }
  # 
  #      _produces:_
  # 
  #         Joe Smith
  #         123 Maple, Anytown NC
  #         12345
  # 
  def each
  end

  # -------------------------------------------------------------- Struct#[]
  #      struct[symbol]    => anObject
  #      struct[fixnum]    => anObject 
  # ------------------------------------------------------------------------
  #      Attribute Reference---Returns the value of the instance variable
  #      named by _symbol_, or indexed (0..length-1) by _fixnum_. Will raise
  #      +NameError+ if the named variable does not exist, or +IndexError+
  #      if the index is out of range.
  # 
  #         Customer = Struct.new(:name, :address, :zip)
  #         joe = Customer.new("Joe Smith", "123 Maple, Anytown NC", 12345)
  #      
  #         joe["name"]   #=> "Joe Smith"
  #         joe[:name]    #=> "Joe Smith"
  #         joe[0]        #=> "Joe Smith"
  # 
  def []
  end

  # ------------------------------------------------------------ Struct#hash
  #      struct.hash   => fixnum
  # ------------------------------------------------------------------------
  #      Return a hash value based on this struct's contents.
  # 
  def hash
  end

  # ------------------------------------------------------- Struct#each_pair
  #      struct.each_pair {|sym, obj| block }     => struct
  # ------------------------------------------------------------------------
  #      Calls _block_ once for each instance variable, passing the name (as
  #      a symbol) and the value as parameters.
  # 
  #         Customer = Struct.new(:name, :address, :zip)
  #         joe = Customer.new("Joe Smith", "123 Maple, Anytown NC", 12345)
  #         joe.each_pair {|name, value| puts("#{name} => #{value}") }
  # 
  #      _produces:_
  # 
  #         name => Joe Smith
  #         address => 123 Maple, Anytown NC
  #         zip => 12345
  # 
  def each_pair
  end

  # ------------------------------------------------------------- Struct#[]=
  #      struct[symbol] = obj    => obj
  #      struct[fixnum] = obj    => obj
  # ------------------------------------------------------------------------
  #      Attribute Assignment---Assigns to the instance variable named by
  #      _symbol_ or _fixnum_ the value _obj_ and returns it. Will raise a
  #      +NameError+ if the named variable does not exist, or an
  #      +IndexError+ if the index is out of range.
  # 
  #         Customer = Struct.new(:name, :address, :zip)
  #         joe = Customer.new("Joe Smith", "123 Maple, Anytown NC", 12345)
  #      
  #         joe["name"] = "Luke"
  #         joe[:zip]   = "90210"
  #      
  #         joe.name   #=> "Luke"
  #         joe.zip    #=> "90210"
  # 
  def []=
  end

  # --------------------------------------------------------- Struct#members
  #      struct.members    => array
  # ------------------------------------------------------------------------
  #      Returns an array of strings representing the names of the instance
  #      variables.
  # 
  #         Customer = Struct.new(:name, :address, :zip)
  #         joe = Customer.new("Joe Smith", "123 Maple, Anytown NC", 12345)
  #         joe.members   #=> ["name", "address", "zip"]
  # 
  def members
  end

  # ------------------------------------------------------------ Struct#to_a
  #      struct.to_a     => array
  #      struct.values   => array
  # ------------------------------------------------------------------------
  #      Returns the values for this instance as an array.
  # 
  #         Customer = Struct.new(:name, :address, :zip)
  #         joe = Customer.new("Joe Smith", "123 Maple, Anytown NC", 12345)
  #         joe.to_a[1]   #=> "123 Maple, Anytown NC"
  # 
  def to_a
  end

  # ---------------------------------------------------------- Struct#length
  #      struct.length    => fixnum
  #      struct.size      => fixnum
  # ------------------------------------------------------------------------
  #      Returns the number of instance variables.
  # 
  #         Customer = Struct.new(:name, :address, :zip)
  #         joe = Customer.new("Joe Smith", "123 Maple, Anytown NC", 12345)
  #         joe.length   #=> 3
  # 
  def length
  end

  # ---------------------------------------------------------- Struct#select
  #      struct.select {|i| block }    => array
  # ------------------------------------------------------------------------
  #      Invokes the block passing in successive elements from _struct_,
  #      returning an array containing those elements for which the block
  #      returns a true value (equivalent to +Enumerable#select+).
  # 
  #         Lots = Struct.new(:a, :b, :c, :d, :e, :f)
  #         l = Lots.new(11, 22, 33, 44, 55, 66)
  #         l.select {|v| (v % 2).zero? }   #=> [22, 44, 66]
  # 
  def select
  end

  def taguri
  end

  # --------------------------------------------------------- Struct#to_yaml
  #      to_yaml( opts = {} )
  # ------------------------------------------------------------------------
  #      (no description...)
  def to_yaml
  end

  # --------------------------------------------------------- Struct#inspect
  #      struct.to_s      => string
  #      struct.inspect   => string
  # ------------------------------------------------------------------------
  #      Describe the contents of this struct in a string.
  # 
  def inspect
  end

end
