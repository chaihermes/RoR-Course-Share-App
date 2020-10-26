class Course < ApplicationRecord
    before_destroy :not_referenced_by_any_line_item
    belongs_to :user, optional: true
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

    extend FriendlyId
    friendly_id :channel, use: [:slugged, :finders]

    def should_generate_new_friendly_id?
        course_changed?
    end


    #Para a busca           #cada paramêtro faz uma busca. Ou seja tem busca por título e por author, então precisa ter dois params
    #Faz a busca se a busca está presente
    def self.search(params)
        courses = Course.where("title LIKE ? or author LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
        courses     #retorna os cursos que contém a palavra buscada
    end


    private

    def not_referenced_by_any_line_item
        unless line_items.empty?
            errors.add(:base, "Itens presentes")
            throw :abort
        end
    end
    
end
