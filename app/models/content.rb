class Content < ActiveRecord::Base
  belongs_to :user
  has_one :problem
  has_one :rating
end
