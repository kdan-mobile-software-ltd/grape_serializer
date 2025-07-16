# Grape Serializer

`Grape Serializer` is a serializer gem which base on grape-entity gem

## Installation

Add `grape_serializer` to your Rails application's `Gemfile`.

### For Rails < 7
```ruby
gem 'grape_serializer', '~> 0.1.0'
```

### For Rails >= 7
```ruby
gem 'grape_serializer', '~> 1.0.6'
```

And then install the gem.

```bash
$ bundle install
```

## Usage

### Entity
* single resource

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

* multiple resources

Inherit `ListEntity`

```ruby
# serializers/test_list_entity.rb
class TestListEntity < ListEntity
  expose :tests, using: TestEntity
end
```


### Serializer
Inherit `GrapeSerializer`

* single resource
```ruby
# serializers/test_serializer.rb

class TestSerializer < GrapeSerializer
  entity TestEntity

  def association_array
    [...]
  end
end
```

* multiple resources
```ruby
# serializers/test_list_serializer.rb

class TestListSerializer < GrapeSerializer
  entity TestListEntity

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

* single resource
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

* multiple resources
```ruby
# in controller actions
resource = {
  a: 1,
  b: 2
}
test_service.result = {test: true}
return serialize_response(:test, [resource, resource], service: test_service) if success?
```

```json
{
  "status": 200,
  "json": {
    "data": [{
      "a": 1,
      "b": 2,
      "test": true
    }, {
      "a": 1,
      "b": 2,
      "test": true
    }]
  } 
}
```
## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
