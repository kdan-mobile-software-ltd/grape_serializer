require 'grape-entity'

class ServiceEntity < Grape::Entity

  # expose service additional info by default
  expose :service_info, merge: true, if: :service

  protected

  def service_info
    service = options[:service]
    service_name = service.class.name.underscore
    send(service_name) rescue nil || send(service_name.split('/').last) rescue {}
  end
end
