module RequestSpecHelper
  def sign_up(resource)
    post api_v1_teacher_registration_path, params: {
      name: resource[:name],
      email: resource[:email],
      password: 'password',
      password_confirmation: 'password',
    }
  end

  def sign_in(resource)
    post api_v1_teacher_session_path, params: {
        email: resource[:email],
        password: 'password'
    }

    authentication_information = {
      access_token: response.header["access-token"],
      client: response.header["client"],
      uid: response.header["uid"],
    }
    return authentication_information
  end
end