class FolderItemsPresenter
  def initialize(items)
    @items = items
  end

  def decorated
    { items: decorated_items }
  end

  class << self
    def decorate(items)
      new(items).decorated
    end
  end

  private

  def decorated_items
    @items.map { |item| FavoritePresenter.decorate(item) }
  end
end
