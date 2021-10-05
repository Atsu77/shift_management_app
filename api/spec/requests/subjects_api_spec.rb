require 'rails_helper'

describe 'Teachers' do
  before do
    FactoryBot.create(:teacher, password: 'password')
    @teacher_attributes = FactoryBot.attributes_for(:teacher)
  end

  it '担当科目を登録する' do
    auth_info = sign_in(@teacher_attributes)
    user = Teacher.find_by(email: @teacher_attributes[:email])
    post "/api/v1/teachers/#{user.id}/subjects",
    headers: auth_info, 
    params: {
      subjects: {
        japanese: true,
        math: true
      }
    }
    expect(response).to have_http_status(:success)
    json = JSON.parse(response.body)
    expect(json["subjects"]["japanese"]).to be true
    expect(json["subjects"]["math"]).to be true

  end

  it 'ユーザーログインする' do
    auth_info = sign_in(@teacher_attributes)
    user = Teacher.find_by(email: @teacher_attributes[:email])
    get "/api/v1/teachers/#{user.id}/subjects", 
    headers: auth_info
    json = JSON.parse(response.body)
    puts json
  end

end
