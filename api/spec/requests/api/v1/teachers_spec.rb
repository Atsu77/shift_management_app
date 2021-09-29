require 'rails_helper'

describe 'TeacherApi' do
  it 'ユーザーを登録する' do
    teacher_attributes = FactoryBot.attributes_for(:teacher)

    post api_v1_teacher_registration_path, params: {
      name: teacher_attributes[:name],
      email: teacher_attributes[:email],
      password: 'password',
      password_confirmation: 'password',
    }
    expect(response).to have_http_status(:success)
  end

end
