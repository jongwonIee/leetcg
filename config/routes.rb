Rails.application.routes.draw do
  devise_for :authors

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: "readers/home#index"
  root to: "home#index"
  get '/product/:id' => 'posts#show', as: :product_post
  get '/product' => "home#index"
  get '/list' => "authors/posts#new"
  get '/products' => "authors/posts#index"
  scope module: 'authors' do
    get 'stats' => 'stats#index'
    resources :posts do
      resources :elements
    end
  end
  resources :order_items
  get 'cart', to: 'cart#show'
end