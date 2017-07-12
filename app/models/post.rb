class Post < ApplicationRecord
  belongs_to :user
  
  validates :content, :presence => true
  
  def icon_url
    user.avatar.url(:icon)
  end
  
  def local_make_time
    created_at.in_time_zone('Hong Kong').strftime('%I:%M%p, %d %b, \'%y')
  end
end
