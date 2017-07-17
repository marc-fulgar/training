class Post < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true
  
  def icon_url
    user.avatar.url(:icon)
  end
  
  def auto_link_content
    Rinku.auto_link(content)
  end
  
  def local_make_time
    time_diff
  end
  
  def time_diff
    diff = (Time.now - created_at.in_time_zone('Hong Kong')).to_i.abs
    hours = diff / 3600
    minutes = diff / 60
    
    if diff < 60
      "Less than a minute ago"
    elsif diff < 120
      "About a minute ago"
    elsif diff < 3600
      "#{minutes} minutes ago"
    elsif diff < 86400
      "#{hours} hours ago"
    else
      created_at.in_time_zone('Hong Kong').strftime('%I:%M%p, %d %b, \'%y')
    end
  end
  
  def absolute_time
    created_at.in_time_zone('Hong Kong').strftime('%I:%M%p, %d %b, \'%y')
  end
end
