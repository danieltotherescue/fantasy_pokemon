class Userpoke < ActiveRecord::Base
  belongs_to :pokemon
  belongs_to :user
  acts_as_votable 
end
