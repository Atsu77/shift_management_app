module RequestSpecHelper
  PASSWORD = 'password'

  def sign_up(resource, teacher_flag=true)
      path = teacher_flag ? api_v1_teacher_registration_path : api_v1_student_registration_path
      post path, params: {
        name: resource[:name],
        email: resource[:email],
        password: PASSWORD,
        password_confirmation: PASSWORD
      }
  end

  def sign_in(resource, teacher_flag=true)
    path = teacher_flag ? api_v1_teacher_session_path : api_v1_student_session_path
    post path, params: {
      email: resource[:email],
      password: PASSWORD
    }

    {
      "access-token": response.header['access-token'],
      "client": response.header['client'],
      "uid": response.header['uid']
    }
  end

  def sign_out(resource, teacher_flag=true)
    path = teacher_flag ? destroy_api_v1_teacher_session_path : destroy_api_v1_student_session_path
    delete path, headers: resource
  end
end
