module ApplicationHelper
  def flash_notifications
    message = flash[:error] || flash[:notice]

    if message
      type = flash.keys[0].to_s
      %Q{$.notification({ message:"#{message}", type:"#{type}" });}
    end
  end
end
