# set

Type-checked set and array

## Example

``` ruby
type = String

set = Collection::Set.new(type)

set.add('something')

set.any? { |item| item == 'something' }
# => true

set.add(:not_a_string)
# => :not_a_string must be a String (ArgumentError)
```

## Generic Style

``` ruby
type = String

cls = Collection::Set[type]

set = cls.new

set.add('something')

set.any? { |item| item == 'something' }
# => true

set.add(:not_a_string)
# => :not_a_string must be a String (ArgumentError)
```

### Extended Implementation

An instance implementation can be specified for a set class by passing it in a block to the generic class constructor.

``` ruby
cls = Collection::Set[String] do
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

## Coercion Method

``` ruby
things = ['Thing 1', 'Thing 2']

set = Collection::Set(things)

set.entry? { |v| v == 'Thing 1' }
# => true

set.entry?('Thing 1')
# => true

set.add(:not_a_string)
# => ArgumentError (:not_a_string must be a String)
```

## Constructor

``` ruby
things = ['Thing 1', 'Thing 2']

set = Collection::Set[String].build(things)

set.entry? { |v| v == 'Thing 1' }
# => true

set.entry?('Thing 1')
# => true

set.add(:not_a_string)
# => ArgumentError (:not_a_string must be a String)
```

## License

The `collection` library is released under the [MIT License](https://github.com/eventide-project/collection/blob/master/MIT-License.txt).
