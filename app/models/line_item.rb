class LineItem < ApplicationRecord
  #belongs_to :course
  belongs_to :product
  belongs_to :cart

  # def total_price
  #   course.price.to_i * quantity.to_i
  # end


  def total_price
    product.price.to_i * quantity.to_i
  end
  
end
