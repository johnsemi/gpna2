Gpna::Application.routes.draw do

  root  'static_pages#home'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/reports', to: 'static_pages#reports', via: 'get'

  match '/developers', to: 'static_pages#developers', via: 'get'

  #devise_for :users do
  #  get "/", :to => "devise/sessions#new"
  #end

  #root :to => "members#index"

  devise_for :users
  #get "static_pages/home"
  #get "static_pages/help"

  resources :members
 
  resources :members do
    resources :donations
  end

  resources :events

  get 'chart/yearly_donations' => 'charts#yearly_donations', :as => :yearly_donations_chart

  get 'chart/member_types' => 'charts#member_types', :as => :member_types_chart

  get 'chart/yearly_members' => 'charts#yearly_members', :as => :yearly_members_chart

  #members GET    /members(.:format)          members#index

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


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
