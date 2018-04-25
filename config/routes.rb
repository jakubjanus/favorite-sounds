Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resource :favorites, only: [:create]
      resource :folders, only: [] do
        get '/root', to: 'folders#root'
      end
    end
  end
end
