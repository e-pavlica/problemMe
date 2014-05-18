class Problem < ActiveRecord::Base
  has_many :contents
  has_many :ratings, through: :contents

  def videos
    contents.where(type: 'Video')
  end

  def images
    contents.where(type: 'Image')
  end

  def quotes
    contents.where(type: 'Quote')
  end

  def audio
    contents.where(type: 'Audio')
  end
end
