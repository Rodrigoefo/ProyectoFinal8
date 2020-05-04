class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  # def set_time
  #   if self
  #     fecha = DateTime.now
  #     fecha.strftime("%T")
  #   end
  # end

end
