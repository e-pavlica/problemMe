class Rating < ActiveRecord::Base
  belongs_to :content

  def upvote
    self.votes += 1
    if self.save
      true
    else
      false
    end
  end

  def downvote
    self.votes -= 1
    if self.save
      true
    else
      false
    end
  end

end
