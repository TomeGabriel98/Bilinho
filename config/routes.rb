Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :universities, only: %i[create show]
  controller :universities do
    post 'universities/new', action: :create, controller: 'universities'
  end
end
