require 'rails_helper'

describe 'Teachers' do
  before do
    FactoryBot.create(:teacher, password: 'password')
    @teacher_attributes = FactoryBot.attributes_for(:teacher)
  end

  it 'ユーザーを新規登録する' do
    sign_up({ name: 'example', email: 'xxx@example.com' })
    expect(response).to have_http_status(:success)
  end

  it 'ユーザーログインする' do
    sign_in(@teacher_attributes)
    expect(response).to have_http_status(:success)
  end

  it 'ユーザーサインアウトする' do
    auth_info = sign_in(@teacher_attributes)
    sign_out(auth_info)
    expect(response).to have_http_status(:success)
  end

  context 'ユーザー情報を更新する' do
    it 'nameとemailを変更' do
      auth_info = sign_in(@teacher_attributes)
      put api_v1_teacher_registration_path, params: {
        password: 'password',
        password_confirmation: 'password',
        name: 'changed',
        email: 'changed@example.com'
      }, headers: auth_info

      expect(response).to have_http_status(:success)
    end
  end
end
