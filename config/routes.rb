Rails.application.routes.draw do
	get 'sums' => 'sums#index'
	post 'sums' => 'sums#create'
	post 'filters' => 'filters#create'  
	post 'intervals' => 'intervals#create'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
