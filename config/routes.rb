Rails.application.routes.draw do


  namespace :organizators do
    get 'profile/index'
    get 'profile/show'
    get 'profile/edit'
    
  end
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
      end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
