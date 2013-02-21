require 'digest'
class User < ActiveRecord::Base
  has_one  :user_image,:dependent=>:destroy
  has_many :partnerships,:dependent=>:destroy
  has_many :beep_pictures,:dependent=>:destroy
  has_one  :profile,:dependent=>:destroy
  has_many :beeps,:dependent=>:destroy
  has_many :items,:dependent=>:destroy
  has_one  :rank,:dependent=>:destroy
  has_many :notifications,:dependent=>:destroy
  has_many :conversations,:dependent=>:destroy
  has_many :messages,:dependent=>:destroy
  has_many :competes,:dependent=>:destroy
  has_many :joins,:dependent=>:destroy
  has_many :comment_competes,:dependent=>:destroy
  has_many :beep_at,:dependent=>:destroy

  
 has_many :partners,
 :through => :partnerships,
 :conditions => "status = 'accepted'"
 has_many :requested_partners,
 :through => :partnerships,
 :source => :partner,
 :conditions => "status = 'requested'"
 has_many :pending_partners,
 :through => :partnerships,
 :source => :partner,
 :conditions => "status = 'pending'"
  
def self.calc_rank(like,dislike,joins,last_login,partners,items)

  return (like + joins + partners + items )- dislike - last_login

end

attr_accessor :password
validates :password, :confirmation => true,
:length => { :within => 4..20 },
:presence => true,
:if => :password_required?
attr_accessible :user_name,:password,:first_name,:last_name,:user_name,:mobile,:email,:address,:state,:country,:day,:year,:month,:user_type,:last_login,:reputation
#validates :user_name,:format =>{:with=>/^[A-Z]/,:message=>"Your username shouldn't have spaces, numbers or symbols eg + - _ * @ etc"}
validates :user_name, :uniqueness => true
validates :email, :presence => true
validates :user_type, :presence => true
validates :country, :presence => true
validates :first_name, :presence => true
validates :last_name, :presence => true
validates :email, :uniqueness => true,
:length => { :within => 5..50 },
:format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i,:message=>"is invalid" }


	
	GENDER_SELECT =[ 
	#Displayed       stored in db
	["Male","male"],["Female","female"]]
	
	COUNTRY_SELECT =[ 
	["Nigeria","Nigeria"]
		]

  STATE_SELECT=[
    ["Lagos","Lagos"],["Abuja","Abuja"]

  ]


	PLAN_TYPE =[
	#Displayed       stored in db
	["Basic         [max 20items]","Basic"],["Premium [max 50items]","Premium"],["Gold [infinite item]","Gold"]]

	BIRTHDAY_SELECT =[["1","1"],["2","2"],["3","3"],["4","4"],["5","5"],["6","6"],["7","7"],["8","8"],["9","9"],["10","10"],
			 ["11","11"],["12","12"],["13","13"],["14","14"],["15","15"],["16","16"],["17","17"],["18","18"],["19","19"],
		         ["20","20"],["21","21"],["22","22"],["23","23"],["24","24"],["25","25"],["26","26"],["27","27"],["28","28"],
			 ["29","29"],["30","30"],["31","31"]]
			  
	MONTH_SELECT =[["January","January"],["Febuary","Febuary"],["March","March"],["April","April"],["May","May"],["June","June"],
	["July","July"],["August","August"],["September","September"],["October","October"],["November","November"],["December","December"]]
	
	YEAR_SELECT=[["1950","1950"],["1951","1951"],["1952","1952"],["1953","1953"],["1954","1954"],["1955","1954"],["1956","1956"],["1957","1957"],
		["1958","1958"],["1959","1959"],["1960","1960"],["1961","1961"],["1962","1962"],["1963","1963"],["1964","1964"],["1965","1965"],["1966","1966"],
		["1967","1967"],["1968","1968"],["1969","1969"],["1970","1970"],["1971","1971"],["1972","1972"],["1973","1973"],["1974","1974"],
		["1975","1975"],["1976","1976"],["1977","1977"],["1978","1978"],["1979","1979"],["1980","1980"],["1981","1982"],["1982","1982"],
		["1983","1983"],["1984","1984"],["1985","1985"],["1986","1986"],["1987","1987"],["1988","1988"],["1989","1989"],["1990","1990"],
		["1991","1991"],["1992","1992"],["1993","1993"],["1994","1994"],["1995","1995"],["1996","1996"],["1997","1997"],["1998","1998"],
		["1999","1999"],["2000","2000"],["2001","2001"],["2002","2002"],["2003","23"],["2004","2004"],["2005","2005"],["2006","2006"], 
		["2007","2007"],["2008","2008"],["2009","2009"],["2010","2010"]]
		
   def self.search(search)
    if search
      self.where('user_name LIKE ?',"%#{search}%")
    else
      self.all
    end
  end



before_save :encrypt_new_password
def self.authenticate(user_name, password)
    user = find_by_user_name(user_name)
    return user if user && user.authenticated?(password)
end

def authenticated?(password)
self.hashed_password == encrypt(password)
end
protected
def encrypt_new_password
return if password.blank?
self.hashed_password = encrypt(password)
end
def password_required?
hashed_password.blank? || password.present?
end
def encrypt(string)
Digest::SHA1.hexdigest(string)
end
 end
