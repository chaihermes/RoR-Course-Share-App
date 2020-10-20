class Course < ApplicationRecord

    mount_uploader :image, ImageUploader
    serialize :image, JSON #config para SQLite
    belongs_to :user, optional: true

    #Validações
    validates :title, :author, presence: true
    validates :description, length: { maximum: 1500, too_long: "%{count} caracteres é o máximo permitido."}
    validates :title, length: { maximum: 140, too_long: "%{count} caracteres é o máximo permitido."}
    validates :price, length: { maximum: 7 }
end
