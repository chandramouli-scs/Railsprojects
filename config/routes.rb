Rails.application.routes.draw do
  get 'modeldetails/admins', as: 'details_admins'
  get 'admins/organisationsspec', to: 'modeldetails#organisationsview', as: 'organisationspec'
  get 'admins/projectsspec', to: 'modeldetails#projectsview', as: 'projectsspec'
  get 'modeldetails/users', as: 'users_admins'
  get 'modeldetails/organisations', as: 'organisations_admins'
  get 'modeldetails/projects', as: 'projects_admins'
  get 'modeldetails/tasks', as: 'tasks_admins'
  get 'dashboard/projectsdash', to: 'dashboard#projectsdash'
  get 'dashboard/tasksdash', to: 'dashboard#tasksdash'
  get 'modeldetails/project_show/:id', to: 'modeldetails#project_show', as: 'projectshow_admins'
  devise_for :admins, path: 'admins', controllers: {
        sessions: 'admins/sessions', registrations: 'admins/registrations', passwords: 'admins/passwords'
      }
  root 'home#index'
  get 'home/dashboard', to: 'home#dashboard', as: 'dashboard_home'
  get 'admin/dashboard', to: 'home#admindashboard', as: 'admindashboard_home'

  resources :projects
  resources :tasks
  resources :organisations
   
  devise_for :users, path: 'users', :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
