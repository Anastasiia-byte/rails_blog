Rails.application.routes.draw do
   
  devise_for :authors
  get 'home/index'
  root to: "readers/home#index"
  
  get '/blog/:id' => 'readers/posts#show', as: :blog_post

  scope module: 'authors' do
    resources :posts do
      resources :elements
    end

  end

  scope module: 'readers' do
    resources :posts do
      resources :comments 
      
    end
    
  end

  resources :comments, only: [:index, :create]
get '/comments/new/(:parent_id)', to: 'comments#new', as: :new_comment


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
