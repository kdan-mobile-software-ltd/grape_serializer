class ListEntity < ServiceEntity

  def self.inherited(subclass)
    expose :total_count
    expose :current_page
    expose :total_pages
  end

  private

  def pagination_items
    object[:items]
  end

  def total_count
    pagination_items.total_count
  end

  def current_page
    pagination_items.current_page
  end
  
  def total_pages
    pagination_items.total_pages
  end
  
end