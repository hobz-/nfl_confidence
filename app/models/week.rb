class Week < ActiveRecord::Base
  has_many :games, :dependent => :destroy
  has_many :picks, :dependent => :destroy
end
