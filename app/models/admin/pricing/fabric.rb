class Admin::Pricing::Fabric < Admin::Pricing::BaseRecord
  after_initialize do
    prepare_price_fields
  end
  
  validates_uniqueness_of :admin_furniture_fabric_brand_id
  belongs_to :brand, class_name: '::Admin::Furniture::Fabric::Brand', foreign_key: :admin_furniture_fabric_brand_id
end
