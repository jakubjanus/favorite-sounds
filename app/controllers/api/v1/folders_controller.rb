module Api
  module V1
    class FoldersController < ApplicationController
      def root
        render json: { items: [{ sound_id: 1 }] }
      end
    end
  end
end
