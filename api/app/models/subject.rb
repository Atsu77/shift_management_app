class Subject < ActiveRecord::Base
  has_many :specialties
  has_many :teachers, through: :specialties
end
