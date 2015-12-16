class User < ActiveRecord::Base
  validates_presence_of :middle_initial

  def add_star
    self.no_stars+=1
  end
end
