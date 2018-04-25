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
        @folder = Folder.new(user_id: user_id, name: folder_name)

        if @folder.save
          render json: FoldersPresenter::FolderPresenter.decorate(@folder), status: :created
        else
          render json: @folder.errors, status: :unprocessable_entity
        end
      end

      def index
        @folders = Folder.for_user(user_id)

        render json: FoldersPresenter.decorate(@folders)
      end

      private

      def folder_id
        params[:id]
      end

      def folder_name
        params[:name]
      end

      def user_id
        1
      end
    end
  end
end
