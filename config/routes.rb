Dzienniczek::Application.routes.draw do
  devise_for :users, :skip => [:registrations]                                          

  constraints(Subdomain) do
    match '/' => 'home#index'  
  end
  
  namespace 'admin' do
    resource :admin
    resources :teachers
    resources :subjects
    resources :divisions do
      member do
        get :download_access_list
      end
    end
    resources :students
  end

  namespace 'teacher' do
    resource :teacher
    resources :registers do
      member do
        get :subjects
        get :students
      end
    end
    resources :grades

    match "/registers/:id/students/:subject_id" => "registers#students"
  end

  namespace 'getter' do
    resource :getter
    resources :grades
  end
  
  resources :messages do
    member do
      get :move
      get :unread
    end
  end
  
  match "/messages/:id/move/:folder" => "messages#move"

  resources :users do
    collection do
      get :edit
      put :update_password
    end
  end

  root :to => "home#index"
end
