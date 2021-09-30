Rails.application.routes.draw do
  devise_for :authors

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "readers/home#index"
  get '/product/:id' => 'readers/posts#show', as: :product_post
  get '/product' => "readers/home#index"
  scope module: 'authors' do
    get 'stats' => 'stats#index'
    resources :posts do
      resources :elements
    end
  end
end