NaxinMstczjuOrg::Application.routes.draw do
  resources :forms do
    collection do
      get :edit, as: 'edit_self'
    end
  end

  ActiveAdmin.routes(self)

  # puts ActiveAdmin::Devise.config
  devise_for :staffs, ActiveAdmin::Devise.config

  root :to => 'forms#new'

  match '/login' => redirect('/admin')
  match '/about', :to => 'pages#about'

end
