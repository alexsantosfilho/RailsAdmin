Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => 'railsadmin.herokuapp.com/', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
