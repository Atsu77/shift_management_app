require 'rails_helper'

describe 'Teachers' do
  before do
    @teacher_attributes = FactoryBot.attributes_for(:teacher)
  end
  context '新規登録機能について' do
    it 'ユーザーを新規登録する' do
      sign_up(@teacher_attributes)
      expect(response).to have_http_status(:success)
    end
  end

  let(:teacher_account) { FactoryBot.create(:teacher, password: 'password') }

  it 'ユーザーログインする' do
    sign_in(teacher_account)
    expect(response).to have_http_status(:success)
  end
end
