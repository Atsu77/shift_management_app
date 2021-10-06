require 'rails_helper'

describe 'Teachers' do
  before do
    teacher = FactoryBot.create(:teacher, password: 'password')
    teacher.subjects.create(japanese: true, english: true)
    @teacher_attributes = FactoryBot.attributes_for(:teacher)
  end

  let(:auth_info) { sign_in(@teacher_attributes) }
  let(:user) { Teacher.find_by(email: @teacher_attributes[:email]) }

  it '担当科目を登録する' do
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
    expect(json['subjects']['japanese']).to be true
    expect(json['subjects']['math']).to be true
  end

  it '担当科目を確認する' do
    get "/api/v1/teachers/#{user.id}/subjects", headers: auth_info
    json = JSON.parse(response.body)
    expect(json['subjects'][0]['japanese']).to be true
    expect(json['subjects'][0]['math']).to be false
    expect(json['subjects'][0]['english']).to be true
  end

  it '担当科目を変更する' do
    put "/api/v1/teachers/#{user.id}/subjects",
        headers: auth_info,
        params: {
          subjects: {
            japanese: false,
            society: true
          }
        }
    json = JSON.parse(response.body)
    expect(json['subjects'][0]['japanese']).to be false
    expect(json['subjects'][0]['society']).to be true
  end

end
