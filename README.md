# Grape Serializer

`Grape Serializer` is a serializer gem which base on grape-entity gem

## Installation

Add `grape_serializer` to your Rails application's `Gemfile`.

```ruby
gem 'grape_serializer'
```

And then install the gem.

```bash
$ bundle install
```

## Usage

### Entity
Inherit `ServiceEntity`

```ruby
# serializers/test_entity.rb
class TestEntity < ServiceEntity
  expose :a, :b

  private

  def test_service
    options[:service].result
  end
end
```

### Serializer
Inherit `GrapeSerializer`

```ruby
# serializers/test_serializer.rb

class TestSerializer < GrapeSerializer
  entity TestEntity

  def association_array
    [...]
  end
end
```

### Controller
Include `GrapeResponse` in your base controller file.

```ruby
# config/application_controller.rb

class ApplicationController
  include GrapeResponse

  ...
end
```

#### Serialize Response

The serialize response is used when the request is success & need to serialize data.

```ruby
# in controller actions
resource = {
  a: 1,
  b: 2
}
test_service.result = {test: true}
return serialize_response(:test, resource, service: test_service) if success?
```

```json
{
  "status": 200,
  "json": {
    "data": {
      "a": 1,
      "b": 2,
      "test": true
    }
  } 
}
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).