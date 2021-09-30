require 'rails_helper'

RSpec.describe Student, type: :model do
  context 'バリデーションについて' do
    it 'addressが75文字以上であればerrorになること' do
      sample_user = FactoryBot.build(:student, :for_validate, password: 'password', address: "a" * 76) 
      expect(sample_user).not_to be_valid
    end

    it 'addressが75文字以内であれば登録できること' do
      sample_user = FactoryBot.build(:student, :for_validate, password: 'password', address: "a" * 75) 
      expect(sample_user).to be_valid
    end

    it 'numberが15文字以上であればerrorになること' do
      sample_user = FactoryBot.build(:student, :for_validate, password: 'password', number: "a" * 16) 
      expect(sample_user).not_to be_valid
    end

    it 'numberが15文字以内であれば登録できること' do
      sample_user = FactoryBot.build(:student, :for_validate, password: 'password', number: "a" * 15) 
      expect(sample_user).to be_valid
    end
  end
end