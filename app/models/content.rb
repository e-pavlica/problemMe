class Content < ActiveRecord::Base
  belongs_to :user
  has_one :problem
  has_one :rating

  # def self.inherited(child)
  #   child.instance_eval do
  #     def model_name
  #       Content.model_name
  #     end
  #   end
  #   super
  # end
end
