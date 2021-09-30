Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'Teacher', at: 'auth', controller: {
        registrations: 'api/v1/auth/registrations'
      }
      mount_devise_token_auth_for 'Student', at: 'auth', controller: {
        registrations: 'api/v1/auth/registrations'
      }
    end
  end
end
