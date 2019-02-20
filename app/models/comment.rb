class Comment < ApplicationRecord
  before_save :check_name
  belongs_to :item

  def check_name
    if self.name.blank?
      self. name = 'anon'
    end
  end
end
