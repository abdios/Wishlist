class Product < ActiveRecord::Base
	has_many :wishes, :dependent => :destroy
	has_many :users, :through => :wishes

  def price_in_euros
    price.to_d/100 if price
  end
  
  def price_in_euros=(euros)
    self.price = euros.to_d*100 if euros.present?
  end
end
