# frozen_string_literal: true

class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :specialties

  validates :address, length: { maximum: 75 }
  validates :number, length: { maximum: 15 }
  validates :profile, length: { maximum: 300 }
end
