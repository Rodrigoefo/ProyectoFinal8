Rails.application.routes.draw do

  root "home#index"

  devise_for :users, controllers: {
         sessions: 'users/sessions',
         registrations: 'users/registrations'
       }

  devise_for :organizators, controllers: {
         sessions: 'organizators/sessions',
         registrations: 'organizators/registrations'
       }


    namespace :users do
        get :timeline, to: 'timeline#index'
        resource :profile
        resources :press_conferences, only: [:index, :show, :destroy] do
          get :solicitar, on: :member

        end
      end


      namespace :organizators do
        get 'profile/index'
        get 'profile/show'
        get 'profile/edit'

        resources :press_conferences

      end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
