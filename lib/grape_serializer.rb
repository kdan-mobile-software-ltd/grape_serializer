require 'grape_response'
require 'service_entity'
require 'list_entity'

class GrapeSerializer

  class << self
    attr_reader :entity_class

    def entity(entity_class)
      @entity_class ||= entity_class
    end
  end

  attr_reader :options

  def initialize(params = {})
    @params = params
  end

  def represent(resource, opts = {})
    @options = opts.merge!(@params)
    preload_associations(resource) if defined?(::Rails::Engine) && defined?(::ActiveRecord) && (resource.is_a?(ActiveRecord::Base) || resource.is_a?(ActiveRecord::Relation))
    self.class.entity_class.represent(resource, @options).as_json
  end

  protected

  def preload_associations(resource)
    if Rails::VERSION::MAJOR >= 7
      ActiveRecord::Associations::Preloader.new(records: [resource].flatten, associations: association_array).call
    else
      ActiveRecord::Associations::Preloader.new.preload(resource, association_array)
    end
  end

  def association_array
  end

end
