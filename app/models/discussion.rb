class Discussion < ApplicationRecord
    belongs_to :user
    has_many :replies, dependent: :destroy      #o dependent cria uma dependência entre as tabelas. Nesse caso, se deletar uma discussion, deleta o reply tb.

    #Validações
    validates :title, :content, presence: true      #só pode postar se tiver o título e o texto
end
