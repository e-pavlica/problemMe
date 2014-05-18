class User < ActiveRecord::Base
  has_many :contents
  has_many :ratings, through: :contents

  def full_name
    [first_name, last_name].join(' ')
  end

end
