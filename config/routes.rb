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

  #admin - project
  get 'modeldetails/project_show/:id', to: 'modeldetails#project_show', as: 'projectshow_admins'
  get 'modeldetails/project_new', to: 'modeldetails#project_new', as: 'ad_project_new'
  get 'modeldetails/project_edit/:id', to: 'modeldetails#project_edit', as: 'ad_project_edit'
  post 'create', to: 'modeldetails#project_create'
  patch 'update/:id', to: 'modeldetails#project_update'
  delete 'modeldetails/project_show/:id', to: 'modeldetails#project_destroy'
  get 'modeldetails/project_details/:id', to: 'modeldetails#project_details', as: 'projectdetails_admins'

  #admin - task
  get 'modeldetails/task_show/:id', to: 'modeldetails#task_show', as: 'ad_task_show'
  get 'modeldetails/task_new', to: 'modeldetails#task_new', as: 'ad_task_new'
  get 'modeldetails/task_edit/:id', to: 'modeldetails#task_edit', as: 'ad_task_edit'
  post 'create/task', to: 'modeldetails#task_create'
  patch 'update/task/:id', to: 'modeldetails#task_update'
  delete 'modeldetails/task_show/:id', to: 'modeldetails#task_destroy'

  #admin - admin
  get 'modeldetails/admin_show/:id', to: 'modeldetails#admin_show', as: 'ad_admin_show'  
  get 'modeldetails/admin_new', to: 'modeldetails#admin_new', as: 'ad_admin_new'
  post 'create/admin', to: 'modeldetails#admin_create'
  get 'modeldetails/admin_edit/:id', to: 'modeldetails#admin_edit', as: 'ad_admin_edit'
  patch 'update/admin/:id', to: 'modeldetails#admin_update' 
  delete 'modeldetails/admin_show/:id', to: 'modeldetails#admin_destroy'

  #admin - user
  get 'modeldetails/user_show/:id', to: 'modeldetails#user_show', as: 'ad_user_show'  
  get 'modeldetails/user_new', to: 'modeldetails#user_new', as: 'ad_user_new'
  post 'create/user', to: 'modeldetails#user_create'
  get 'modeldetails/user_edit/:id', to: 'modeldetails#user_edit', as: 'ad_user_edit'
  patch 'update/user/:id', to: 'modeldetails#user_update' 
  delete 'modeldetails/user_show/:id', to: 'modeldetails#user_destroy'

  #admin - organisation
  get 'modeldetails/organisation_details/:id', to: 'organisations#organisation_details', as: 'organisationdetails_admins'

  # devise admins     
  devise_for :admins, skip: [:registrations], path: 'admins', controllers: {
        sessions: 'admins/sessions', registrations: 'admins/registrations', passwords: 'admins/passwords'
      }
  as :admin do 
    get 'admins/edit' => 'admins/registrations#edit', :as => 'edit_admin_registration'
  put '/admins(.:format)' => 'admins/registrations#update', as: 'admin_registration'
  patch '/admins(.:format)' => 'admins/registrations#update'
  end
      
  root 'home#index'
  get 'home/dashboard', to: 'home#dashboard', as: 'dashboard_home'
  get 'admin/dashboard', to: 'home#admindashboard', as: 'admindashboard_home'

  #tasks
  get 'tasks', to: 'tasks#index', as: 'tasks'
  get 'tasks/:id', to: 'tasks#show', as: 'task'  
  get 'task/new', to: 'tasks#new', as: 'new_task'
  post 'create/tasks', to: 'tasks#create'
  get 'tasks/edit/:id', to: 'tasks#edit', as: 'edit_task'
  patch 'tasks/update/:id', to: 'tasks#update' 
  delete 'tasks/:id', to: 'tasks#destroy'

  #projects
  get 'projects', to: 'projects#index', as: 'projects'
  get 'projects/:id', to: 'projects#show', as: 'project'  
  get 'project/new', to: 'projects#new', as: 'new_project'
  post 'create/projects', to: 'projects#create'
  get 'projects/edit/:id', to: 'projects#edit', as: 'edit_project'
  patch 'projects/update/:id', to: 'projects#update' 
  delete 'projects/:id', to: 'projects#destroy'
  
  #organisations
  get 'organisations', to: 'organisations#index', as: 'organisations'
  get 'organisations/:id', to: 'organisations#show', as: 'organisation'  
  get 'organisation/new', to: 'organisations#new', as: 'new_organisation'
  post 'create/organisations', to: 'organisations#create'
  get 'organisations/edit/:id', to: 'organisations#edit', as: 'edit_organisation'
  patch 'organisations/update/:id', to: 'organisations#update' 
  delete 'organisations/:id', to: 'organisations#destroy' 

  devise_for :users, path: 'users', :controllers => { registrations: 'registrations' }
  
end
