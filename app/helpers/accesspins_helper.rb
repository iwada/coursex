module AccesspinsHelper

 def showText(statustext)
   if(statustext)
     return "Avaliable"
   else
     return "Has  been Used "
   end
  end
   def totalpins
     return @total = Accesspin.all.count;
   end

   def usedpins
     return @total = Accesspin.find_all_by_status(false).count;
   end

   def unusedpins
     return @total = Accesspin.find_all_by_status(true).count;
   end

   def usedon(id)
     @a = Accesspin.find_by_value(id)
     if(@a.created_at == @a.updated_at)
       "Has not been Used"
     else
       @a.created_at.strftime("%d %b. %Y")
     end
 end
end
