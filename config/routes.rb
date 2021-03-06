Rails.application.routes.draw do
   
  devise_for :authors
  get 'home/index'
  root to: "readers/home#index"
  
  get '/blog/:id' => 'readers/posts#show', as: :blog_post

  scope module: 'authors' do
    resources :posts do
      resources :elements
    end

    resources :posts do
      resources :likes
    end

    resources :posts do
      resources :comments 
      
    end

    resources :posts do
      put 'published' => 'posts#published', on: :member, as: :published
      put 'unpublished' => 'posts#unpublished', on: :member, as: :unpublished
    end

  end

  scope module: 'readers' do
    
    resources :posts do
      resources :tags
      
    end


    
  end



  


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
