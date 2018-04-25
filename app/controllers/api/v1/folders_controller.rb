module Api
  module V1
    class FoldersController < ApplicationController
      def root
        @favorites = Favorite.for_root_folder

        render json: FolderItemsPresenter.decorate(@favorites)
      end
    end
  end
end
