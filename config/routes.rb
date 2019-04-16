Rails.application.routes.draw do
  default_url_options :host => "http://localhost:3000"
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    # etc
  }
  mount RailsAdmin::Engine => '/', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
