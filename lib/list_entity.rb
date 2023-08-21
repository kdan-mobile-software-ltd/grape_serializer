class ListEntity < ServiceEntity

  def self.inherited(subclass)
    subclass.present_collection true

    subclass.expose :total_count
    subclass.expose :current_page
    subclass.expose :total_pages
  end

  private

  def pagination_items
    object[:items]
  end

  def total_count
    if pagination_items.respond_to?(:total_count)
      pagination_items.total_count
    elsif pagination_items.respond_to?(:length)
      pagination_items.length
    end
  end

  def current_page
    if pagination_items.respond_to?(:current_page)
      pagination_items.current_page
    else
      1
    end
  end
  
  def total_pages
    if pagination_items.respond_to?(:total_pages)
      pagination_items.total_pages
    else
      1
    end
  end
  
end