require 'grape-entity'

class ServiceEntity < Grape::Entity

  # expose append info
  expose :append_info, merge: true, if: :append

  # expose service additional info by default
  expose :service_info, merge: true, if: :service

  protected

  def service_info
    service = options[:service]
    service_name = service.class.name.underscore
    send(service_name) rescue nil || send(service_name.split('/').last) rescue {}
  end

  def append_info
    options[:append]
  end
  
end
