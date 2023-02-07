module GrapeResponse

  def serialize_response(serializer_name, resource, **options)
    set_serializer_class(serializer_name)
    serializer = serializer_class.new(current_member: current_member)
    render status: 200, json: {data: serializer.represent(resource, options)}
  end

  private

  def current_member
    super
  rescue NoMethodError
  end

  def controller_path
    super
  end

  def serializer_class
    @serializer_class
  end

  def serializer_class=(class_name)
    @serializer_class = class_name.safe_constantize
  end
  
  def set_serializer_class(serializer_name)
    serializer_class_name = "#{serializer_name.to_s.camelize}Serializer"
    if controller_path.nil?
      self.serializer_class = serializer_class_name
    else
      controller_name = controller_path.classify
      self.serializer_class = controller_name.gsub(/Api::(\w+)::\S+$/, "Api::#{'\1'}::#{serializer_class_name}")
    end
    serializer_class
  end
  
end