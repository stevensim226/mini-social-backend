Rails.application.routes.draw do
  
  # Status Updates
  get 'comment/read_specific'
  get 'status', to: "status_update#read"
  get 'status/:id', to: "status_update#read_specific"
  post 'status', to: "status_update#create"
  delete 'status/:id', to: "status_update#delete"
  put 'status/:id', to: "status_update#update"

  # Comments
  post 'comment/:status_id', to: "comment#create"
  delete 'comment/:comment_id', to: "comment#delete"


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
