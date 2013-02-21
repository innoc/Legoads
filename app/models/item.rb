class Item < ActiveRecord::Base
	belongs_to :user
  has_many :feeds,:dependent =>:destroy
	has_many :comments, :dependent =>:destroy
  has_many :pictures, :dependent=>:destroy
  accepts_nested_attributes_for :pictures,:allow_destroy => true

  attr_accessible :item_name,:description,:contact_number,:BlackBerry_pin,:category_type,:category,:item_condition,:manufacturer,:item_price,:partner_price,:user_id,:pictures_attributes

  validates :item_name, :presence => true
  validates :description, :presence => true
  validates :category, :presence => true
  validates :item_condition,:presence => true
  validates :manufacturer, :presence=>true
  validates :item_price, :numericality => true
 

  validates :item_price, :presence => true
  validates :item_price, :length => {  
    :minimum   => 3,
    :maximum   => 9,
    :too_short => "must have at least %{count} digits",
    :too_long  => "must have at most %{count} digits"}



 

    CATEGORY_SELECT =[
    #Displayed       stored in db
    ["Laptops","Laptops"],
    ["Tablet Computers","Tablet Computers"],
    ["Mobile Phones","Mobile Phones"],
    ["Video Games","Video Games"],
    ["ipods","ipods"],
    ["Home theaters","Home theaters"],
    ["Electronic home appliances","Electronic home appliances"],
    ["Musical instruments", "Musical instruments"],
    ["Male cloths","Male cloths"],
    ["Female cloths","Female cloths"],
    ["Kids outfit","Kids outfits"],
    ["shoes","shoes"],
    ["Books","Books"],
    ["Antiques","Antiques"],
    ["jewelry & watches","jewelry & watches"],
    ["Perfumes","Perfumes"],
    ["Books","Books"],
    ["Stationary","Stationary"]
	  ]
	
	ITEM_CONDITION =[ ["Used","Used"],["New","New"],["Not working","Not working"],["Almost new","Almost new"]]
  AUCTION_DURATION =[ ["3 days",3],["5 days",5],["7 days",7],["10 days",10 ],["15 days",15]]
  SHIPPING_DURATION =[ ["3 days",3],["5 days",5],["7 days",7],["10 days",10 ],["15 days",15]]
  DURATION_AGENT=[ ["DHL","DHL"],["Fedex","Fedex"]]
  ITEM_QUANTITY =[ ["Used","Used"],["New","New"]]

  ITEM_SALE_TYPE =[ ["Auction","Auction"],["Constant price","Constant price"]]

   def self.search(search)
    if search
      where('item_name LIKE ?',"%#{search}%")
    end
  end

    def self.solditems(user)
    if user
     find(:all,:conditions=>["user_id=? and item_status=?",user,"SOLD"])
    else
      find(:all)
    end
  end

    def self.freeitems(user)
    if user
     find(:all,:conditions=>["user_id=? and item_status=?",user,"FREE"])
    else
      find(:all)
    end
  end



end 









