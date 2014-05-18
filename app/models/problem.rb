class Problem < ActiveRecord::Base
  has_many :contents
  has_many :ratings, through: :contents

end
