class LineItem < ApplicationRecord
  belongs_to :course
  belongs_to :cart

  def total_price
    course.price.to_i * quantity.to_i
  end
  
end
