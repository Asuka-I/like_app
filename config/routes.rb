Rails.application.routes.draw do
  root "posts#index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    passwords: "users/passwords"
  }
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  resources :posts do
    resource :likes, only: %i[create destroy]
  end
end