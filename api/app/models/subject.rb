class Subject < ActiveRecord::Base
  has_many :specialties
  has_many :students, through: :specialties
end
