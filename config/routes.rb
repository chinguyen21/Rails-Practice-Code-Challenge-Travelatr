Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers
  resources :destinations
  resources :posts
  post '/posts/:id/update_likes', to: 'posts#update_likes', as: "update_likes"
end
