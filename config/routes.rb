Rails.application.routes.draw do


  root "home#index"

  devise_for :users, controllers: {
         sessions: 'users/sessions',
         registrations: 'users/registrations'
       }

      namespace :users do
        get :timeline, to: 'timeline#index'
        resource :profile
      end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
