class Game < ActiveRecord::Base
  belongs_to :week
  has_many :picks
end
