class Venue < ActiveRecord::Base
  has_many :game_matches
end
