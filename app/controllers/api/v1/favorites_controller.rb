module Api
  module V1
    class FavoritesController < ApplicationController
      def create
        @favorite = Favorite.new(sound_id: sound_id, folder_id: folder_id, user_id: user_id)

        if @favorite.save
          render json: FavoritePresenter.decorate(@favorite), status: :created
        else
          render json: @favorite.errors, status: :unprocessable_entity
        end
      end

      private

      def sound_id
        params[:sound_id]
      end

      def folder_id
        params[:folder_id]
      end

      # mock default user as user profiles management is out of the scope of this implementation
      def user_id
        @current_user.id
      end
    end
  end
end
