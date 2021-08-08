Rails.application.routes.draw do
  
  get 'status', to: "status_update#read"
  get 'status/:id', to: "status_update#read_specific"

  post 'status', to: "status_update#create"

  delete 'status/:id', to: "status_update#delete"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
