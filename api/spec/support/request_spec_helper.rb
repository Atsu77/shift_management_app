module RequestSpecHelper
  def sign_up(resource)
    post api_v1_teacher_registration_path, params: {
      name: resource[:name],
      email: resource[:email],
      password: 'password',
      password_confirmation: 'password'
    }
  end

  def sign_in(resource)
    post api_v1_teacher_session_path, params: {
      email: resource[:email],
      password: 'password'
    }

    {
      "access-token": response.header['access-token'],
      "client": response.header['client'],
      "uid": response.header['uid']
    }
  end

  def sign_out(resource)
    delete destroy_api_v1_teacher_session_path, headers: resource
  end
end
