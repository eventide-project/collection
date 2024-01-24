# collection

Type-checked set

## Example

``` ruby
type = String

collection = Collection::Set.new(type)

collection.add('something')

collection.entry? { |v| v == 'something' }
# => true

collection.entry?('something')
# => true

collection.add(:not_a_string)
# => ArgumentError (:not_a_string must be a String)
```

## Generic Style

``` ruby
type = String

cls = Collection::Set[type]

cls
# => "Collection::Set::String"

collection = cls.new

collection.add('something')

collection.entry? { |v| v == 'something' }
# => true

collection.entry?('something')
# => true

collection.add(:not_a_string)
# => ArgumentError (:not_a_string must be a String)
```

### Extended Implementation

An instance implementation can be specified for a collection class by passing it in a block to the generic class constructor.

``` ruby
cls = Collection::Set[String] do
  def underscore
    items.join('_')
  end
end

collection = cls.new

collection.add('something')
collection.add('else')

collection.underscore
# => something_else
```

## Coercion Method

``` ruby
things = ['Thing 1', 'Thing 2']

collection = Collection::Set(things)

collection.entry? { |v| v == 'Thing 1' }
# => true

collection.entry?('Thing 1')
# => true

collection.add(:not_a_string)
# => ArgumentError (:not_a_string must be a String)
```

## Constructor

``` ruby
things = ['Thing 1', 'Thing 2']

collection = Collection::Set[String].build(things)

collection.entry? { |v| v == 'Thing 1' }
# => true

collection.entry?('Thing 1')
# => true

collection.add(:not_a_string)
# => ArgumentError (:not_a_string must be a String)
```

## License

The `collection` library is released under the [MIT License](https://github.com/eventide-project/collection/blob/master/MIT-License.txt).
