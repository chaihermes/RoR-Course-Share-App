class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy

    def add_course(course)
        #ao add o curso, pega os itens que estão no carrinho, pra formar o carrinho. Vai encontrar os itens através do id de cada curso add no carrinho
        current_item = line_items.find_by(course_id: course.id)
        if current_item
            current_item.increment(:quantity)
        else
            current_item = line_items.build(course_id: course.id)
        end
        current_item
    end

    def total_price
        line_items.to_a.sum { |item| item.total_price }
    end
end
