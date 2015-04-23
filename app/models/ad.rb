class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  validates :category_id, presence: :true
  

  self.per_page = 10

  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  
end
