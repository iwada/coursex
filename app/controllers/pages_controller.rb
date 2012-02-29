class PagesController < ApplicationController
  skip_before_filter :require_login


  def home
    @title = "Home"
  end

  def contact
    @title = "Contact"
  end

  def help
    @title = "Help"
  end

  def whoweare
    @title = "Who we Are"
  end

  def whatwedo
    @title = "What we Do"
  end

  def ourcourses
    @title = "Our Course List"
  end

  def blog
    @title = "Blog"
  end



end
