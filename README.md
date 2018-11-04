# collection

Strictly-typed set

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

## License

The `collection` library is released under the [MIT License](https://github.com/eventide-project/collection/blob/master/MIT-License.txt).
