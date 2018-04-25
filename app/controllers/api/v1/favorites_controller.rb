module Api
  module V1
    class FavoritesController < ApplicationController
      def create
        render json: { sound_id: 1, folder_id: 'root' }, status: :created
      end
    end
  end
end
