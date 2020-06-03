Rails.application.routes.draw do
  get 'topics/index'
  get 'topics/show'
  get 'topics/new'
  get 'topics/edit--skip-routes'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
