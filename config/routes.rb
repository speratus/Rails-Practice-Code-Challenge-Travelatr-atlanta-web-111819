Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers, only: [:show]
  resources :destinations, only: [:index, :show]
  resources :posts
  get '/posts/:id/like', to: 'posts#like', as: 'like_post'
end
