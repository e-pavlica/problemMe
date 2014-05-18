class Content < ActiveRecord::Base
  before_save :add_rating

  belongs_to :user
  has_one :problem
  has_one :rating

  def add_rating
    self.rating = Rating.create
  end
end
