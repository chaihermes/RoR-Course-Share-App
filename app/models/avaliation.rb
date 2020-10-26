class Avaliation < ApplicationRecord

    belongs_to :course
    belongs_to :user
    has_many :responds, dependent: :destroy     #Deixa o destroy dependente da resposta, ou seja, se a avaliação for deletada, a resposta tb é deletada.

    #Validações:
    validates :title, :content, presence: true  #FIXME: verificar se vou deixar a nota obrigatória
    resourcify
end
