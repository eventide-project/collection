# Collection

Type-checked set and array

## Overview

The Collection library provides implementations of type-checked set and array classes.

Collections are constructed with a type parameter that controls the type of element that can be added to the collection.

## Example

``` ruby
type = String

array = Collection::Array.new(type)

array.add('something')

array.any? { |item| item == 'something' }
# => true

array.add(:not_a_string)
# => :not_a_string must be a String (ArgumentError)
```

## Array

### Generic-Style Class Definition

``` ruby
type = String

cls = Collection::Array[type]

array = cls.new
```

### Coercion Method

``` ruby
items = ['something', 'something else']

array = Collection::Array(items)
```

### Constructor

``` ruby
items = ['something', 'something else']

cls = Collection::Set[String]

cls.build(items)
```

### Extended Implementation

An instance implementation can be specified by passing it in a block to either its generic constructor or its coercion method.

#### Generic-Style Class Definition

``` ruby
cls = Collection::Array[String] do
  def underscore
    items.join('_')
  end
end

set = cls.new

set.add('something')
set.add('else')

set.underscore
# => something_else
```

#### Coercion Method

``` ruby
items = ['something', 'something else']

array = Collection::Array(items) do
  def underscore
    items.join('_')
  end
end

array.underscore
# => something_else
```

## Set

The `Collection::Set` implements the same interface as the `Collection::Array`. The examples above apply equally to `Collection::Set`.

## Enumerable

`Collection::Set` and `Collection::Array` implement Ruby's `Enumerable` module. The standard set of methods available on any Ruby enumerable are available to both `Collection::Set` and `Collection::Array`.

## License

The `collection` library is released under the [MIT License](https://github.com/eventide-project/collection/blob/master/MIT-License.txt).
