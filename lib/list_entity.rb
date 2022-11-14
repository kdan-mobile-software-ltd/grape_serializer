class ListEntity < ServiceEntity

  def self.inherited(subclass)
    subclass.present_collection true

    subclass.expose :total_count
    if pagination_items.respond_to?(:current_page)
      subclass.expose :current_page
      subclass.expose :total_pages
    end
  end

  private

  def pagination_items
    object[:items]
  end

  def total_count
    if pagination_items.respond_to?(:total_count)
      pagination_items.total_count
    elsif pagination_items.is_a?(Array)
      pagination_items.length
    end
  end

  def current_page
    pagination_items.current_page
  end
  
  def total_pages
    pagination_items.total_pages
  end
  
end