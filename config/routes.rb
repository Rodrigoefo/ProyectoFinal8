Rails.application.routes.draw do

  resources :contactmes

  root "home#index"

  get 'home/team', to: 'home#team'
  get 'home/about', to: 'home#about'

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
                member do
                  get :solicitar
                  get :follow
                  get :unfollow
                end
              end

            end


        namespace :organizators do
          get 'profile/index'
          get 'profile/show'
          get 'profile/edit'
          patch 'profile/:id', to: 'profile#update'

          resources :press_conferences
          resources :users, only: :show
          resources :solicitudes, only: [:update, :show]

        end


    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
