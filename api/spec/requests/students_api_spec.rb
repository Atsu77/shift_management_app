require 'rails_helper'

describe 'Students' do
  before do
    FactoryBot.create(:student, password: 'password')
    @student_attributes = FactoryBot.attributes_for(:student)
  end

  it 'ユーザーを新規登録する' do
    sign_up({ name: 'example', email: 'xxx@example.com' }, teacher_flag=false)
    expect(response).to have_http_status(:success)
  end

  it 'ユーザーログインする' do
    sign_in(@student_attributes, teacher_flag=false)
    expect(response).to have_http_status(:success)
  end

  it 'ユーザーサインアウトする' do
    auth_info = sign_in(@student_attributes, teacher_flag=false)
    sign_out(auth_info, teacher_flag=false)
    expect(response).to have_http_status(:success)
  end

  context 'ユーザー情報を更新する' do
    it 'nameとemailを変更' do
      auth_info = sign_in(@student_attributes, teacher_flag=false)
      put api_v1_student_registration_path, params: {
        password: 'password',
        password_confirmation: 'password',
        name: 'changed',
        email: 'changed@example.com'
      }, headers: auth_info

      expect(response).to have_http_status(:success)
    end
  end

end
