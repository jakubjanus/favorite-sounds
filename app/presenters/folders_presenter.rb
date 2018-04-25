class FoldersPresenter
  def initialize(folders)
    @folders = folders
  end

  def decorated
    { folders: decorated_items }
  end

  class << self
    def decorate(folders)
      new(folders).decorated
    end
  end

  private

  def decorated_items
    @folders.map { |item| FolderPresenter.decorate(item) }
  end

  class FolderPresenter
    def initialize(folder_model)
      @folder = folder_model
    end

    def decorated
      {
        id: @folder.id,
        name: @folder.name
      }
    end

    class << self
      def decorate(folder)
        new(folder).decorated
      end
    end
  end
end
