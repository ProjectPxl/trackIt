Rails.application.routes.draw do
  root 'users#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resource :projects, :hours

  post "/add_hours"   => "projects#add_hours"
  get "/projects/:id" => "projects#show", as: :show_project #??????
end
