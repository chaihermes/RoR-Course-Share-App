class Course < ApplicationRecord
    before_destroy :not_referenced_by_any_line_item
    belongs_to :user, optional: true
    belongs_to :discussion
    has_many :line_items
    mount_uploader :image, ImageUploader
    serialize :image, JSON #config para SQLite

    #Para a parte de avaliações
    has_many :avaliations
    has_many :users, through: :avaliations

    #Validações
    validates :title, :author, presence: true
    validates :description, length: { maximum: 1500, too_long: "%{count} caracteres é o máximo permitido."}
    validates :title, length: { maximum: 140, too_long: "%{count} caracteres é o máximo permitido."}
    validates :price, length: { maximum: 7 }

    resourcify


    private

    def not_referenced_by_any_line_item
        unless line_items.empty?
            errors.add(:base, "Itens presentes")
            throw :abort
        end
    end
    
end
