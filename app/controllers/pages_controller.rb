class PagesController < ApplicationController
 #skip_before_filter :require_login, :only => [:home]
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

  end

  def whatwedo

  end

  def courses

  end

  def blog

  end



end
