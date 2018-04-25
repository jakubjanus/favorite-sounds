module Api
  module V1
    class FoldersController < ApplicationController
      def root
        @favorites = Favorite.for_root_folder

        render json: FolderItemsPresenter.decorate(@favorites)
      end

      def show
        @favorites = Favorite.for_folder(folder_id)

        render json: FolderItemsPresenter.decorate(@favorites)
      end

      def create
        render json: { name: params[:name], id: 1 }, status: :created
      end

      private

      def folder_id
        params[:id]
      end
    end
  end
end
