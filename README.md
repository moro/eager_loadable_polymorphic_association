# EagerLoadablePolymorphicAssociation

add eager loading functionality to ActiveRecord's polymorphic association.

## Installation

Add this line to your application's Gemfile:

    gem 'eager_loadable_polymorphic_association'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eager_loadable_polymorphic_association

## Usage

```
class Paste < ActiveRecord::Base
  extend EagerLoadablePolymorphicAssociation

  belongs_to :item, polymorphic: true
  eager_loadable_polymorphic_association :item, [:snippet, :picture]
end

Paste.with_item.all # => eager load associated snippet or picture
```

1. extend this module
2. decrare `eager_loadable_polymorphic_association` during class definition.
  1. first argument is polymorphic association name
  2. second, pass an array which contains associated objects class names (item_type.under_score).
3. step 2 defines new scope `with_item`, which is the scope to eager load polymorphic objects.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
