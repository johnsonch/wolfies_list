class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  validates :category_id, presence: :true
  attr_accessor :current_temp
  

  self.per_page = 10

  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  

  
  def current_temp
    response = RestClient.get("http://api.openweathermap.org/data/2.5/weather?lat=#{self.latitude}&lon=#{self.longitude}")
    temp = JSON.parse(response)["main"]["temp"]
    (temp - 273.15)* 1.8000 + 32.00
  end
  
end
