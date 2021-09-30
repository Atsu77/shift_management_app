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

  context 'バリデーションについて' do
    it 'addressが75文字以上であればerrorになること' do
      sample_user = FactoryBot.build(:teacher, :for_validate, password: 'password', address: "a" * 76) 
      expect(sample_user).not_to be_valid
    end

    it 'addressが75文字以内であれば登録できること' do
      sample_user = FactoryBot.build(:teacher, :for_validate, password: 'password', address: "a" * 75) 
      expect(sample_user).to be_valid
    end

    it 'numberが15文字以上であればerrorになること' do
      sample_user = FactoryBot.build(:teacher, :for_validate, password: 'password', number: "a" * 16) 
      expect(sample_user).not_to be_valid
    end

    it 'numberが15文字以内であれば登録できること' do
      sample_user = FactoryBot.build(:teacher, :for_validate, password: 'password', number: "a" * 15) 
      expect(sample_user).to be_valid
    end

    it 'profileが300文字以上であればerrorになること' do
      sample_user = FactoryBot.build(:teacher, :for_validate, password: 'password', profile: "a" * 301) 
      expect(sample_user).not_to be_valid
    end

    it 'profileが300文字以内であれば登録できること' do
      sample_user = FactoryBot.build(:teacher, :for_validate, password: 'password', profile: "a" * 300) 
      expect(sample_user).to be_valid
    end
  end

end
