class FavoritePresenter
  def initialize(favorite_model)
    @favorite = favorite_model
  end

  def decorated
    {
      sound_id: @favorite.sound_id,
      folder_id: folder_id
    }
  end

  class << self
    def decorate(favorite_model)
      new(favorite_model).decorated
    end
  end

  private

  def folder_id
    @favorite.folder_id.nil? ? 'root' : @favorite.folder_id
  end
end
