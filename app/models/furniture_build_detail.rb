class FurnitureBuildDetail < ApplicationRecord
  belongs_to :admin_furniture_sections
  belongs_to :admin_furniture_specs
  belongs_to :admin_furniture_scales
end
