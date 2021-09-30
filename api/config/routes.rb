Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'Teacher', at: 'teacher_auth', controller: {
        registrations: 'api/v1/auth/teacher_registrations'
      }
      mount_devise_token_auth_for 'Student', at: 'student_auth', controller: {
        registrations: 'api/v1/auth/student_registrations'
      }
    end
  end
end
