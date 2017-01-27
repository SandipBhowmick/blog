Rails.application.routes.draw do

	resources :access, only: [:index, :login]	
	resources :users 
	   resources :posts do
   		resources :comments
  		 end
  		
   root "posts#index"
   get 'blog', :to => "access#index"












    match ':controller(/:action(/:id))', :via => [:get, :post]

end
