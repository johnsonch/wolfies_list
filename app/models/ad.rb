class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  validates :category_id, presence: :true
  
  self.per_page = 10
  
end
