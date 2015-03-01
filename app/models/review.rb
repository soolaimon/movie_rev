class Review < ActiveRecord::Base
  before_create :set_rt_data



  private

  def set_rt_data
    
  end
end
