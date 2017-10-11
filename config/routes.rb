Rails.application.routes.draw do


  # get 'landing/index'
  devise_for :users

  root to: 'photos#index'

  resources :photos do
    resources :comments
    member do
      put "like", to: "photos#upvote"
      put "dislike", to: "photos#downvote"
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
