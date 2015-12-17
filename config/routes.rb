Rails.application.routes.draw do
  
  get "landing" => "pages#landing"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources "contacts", only: [:new, :create]
  get 'contact' => 'contacts#new'
  post 'contact' => 'contacts#create'

  
  resources :pins do
    member do
      put "like", to: "pins#upvote"
      put "dislike", to: "pins#downvote"
    end
    collection do
      get 'search'
    end
    resources :reviews, except: [:show, :index]
  end
  resources :charges
  authenticated :user do
    root "pins#index" 
  end
  unauthenticated :user do
    get "/" => "pins#index"
  end

  get "sitemap" => "pages#sitemap"
  get "scrape" => "pages#scrape"
  get "your_pins" => "users#dock"
  get "about" => "pages#about"
  get "contact" => "pages#contact"
  get "feed" => "feed#index"
  get "users" => "users#index"
  get "users/:id/pins" => "users#pins", :as => :user_pins
  get "users/:id/following" => "users#following", :as => :following_user
  get "users/:id/followers" => "users#followers", :as => :followers_user
  resources :relationships, only: [:create, :destroy]
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
