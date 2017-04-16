class Employee::Fani < ApplicationRecord
  belongs_to :users
  belongs_to :furnitures
  
  has_and_belongs_to_many :furniture_build_details, class_name: '::FurnitureBuildDetail', foreign_key: :employee_fani_id

  attr_accessor :days_to_complete_scale
  
  validates_numericality_of :days_to_complete, greater_than: 0
  validates_presence_of :wage_rokob, :wage_khayat, :days_to_complete
  
  # delete the associated build details
  before_destroy { furniture_build_details.each(&:destroy) }
end
