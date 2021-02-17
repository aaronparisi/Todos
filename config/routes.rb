Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    defaults format: :json do
      resources :todos, except: [ :new, :edit ] do
        collection do
          get '/complete', to: 'todos#completeTodos', as: 'complete'
          get '/incomplete', to: 'todos#incompleteTodos', as: 'incomplete'
        end
      end

      resources :steps, except: [ :new, :edit ] do
        # not sure if I need complete and incomplete?
      end

      
    end
    
  end

  resources :users do
    member do
      get '/todos', to: 'todos#index', as: 'todos', format: :json
    end
  end

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  
  root to: 'api/static_pages#root'
  # root to: 'api/sessions#new'
end
