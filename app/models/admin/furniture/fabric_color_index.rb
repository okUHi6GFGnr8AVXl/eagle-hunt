class Admin::Furniture::FabricColorIndex < ApplicationRecord
  belongs_to :admin_furniture_fabric
  belongs_to :admin_furniture_fabric_color
end