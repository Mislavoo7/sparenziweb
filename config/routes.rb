Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'login', to: 'auth#login'
      post 'logout', to: 'auth#logout'
      get 'profile', to: 'auth#profile'
      post 'signup', to: 'auth#signup'
      post 'settings', to: 'settings#update'
      resources :legal_pages, only: [:index], path: "legal-pages"
      resources :lists, except: [:edit, :new] do
        resources :products, only: [:create, :destroy]
      end
    end
  end

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users
    devise_for :admins
    root "pages#index"
    resources :legal_pages, only: [:show], path: "legal-pages"

    namespace :user do 
      root 'lists#index'
      resource :accounts,        only: [:show, :update, :destroy], path: :accounts, as: :accounts
      get 'destroy-me', to: 'accounts#destroy_me'
      resources :lists, except: :show do
        collection do
          patch :sort
        end
        member do
          patch :visibility
        end
        resources :products, except: [:index, :show] do
          collection do
            patch :sort
          end
          member do
            patch :visibility
          end
        end
      end
    end

    namespace :admin do
      root 'pages#index'
      resources :admins, except: [:show]
      resources :users, only: [:index, :destroy] do
        member do
          patch :block
        end
      end
      resources :pages, only: [:edit, :update, :show] do
        collection do
          patch :sort
        end
        member do
          patch :visibility
        end
        resources :sections, except: [:index, :show] do
          collection do
            patch :sort
          end
          member do
            patch :visibility
          end
        end
      end
      resources :legal_pages, except: [:show], path: "legal-pages" do
        collection do
          patch :sort
        end
        member do
          patch :visibility
        end
      end
    end

    resources :pages, only: :show, path: ""
  end

  %w( 404 422 500 ).each do |code|
    get code, to: "errors#show", code: code
  end
end
