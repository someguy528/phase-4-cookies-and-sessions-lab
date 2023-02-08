class Article < ApplicationRecord
  belongs_to :user

  def author
    user.username
  end

  def preview
    content.split("\n")[1]
  end

  def date
    created_at.strftime('%B %e, %Y')
  end

  def self.view_page
    session[:page_views]||= 0
    session[:page_views] < 4  
    session[:page_views] += 1
  end

end
