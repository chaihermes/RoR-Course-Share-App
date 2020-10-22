class Respond < ApplicationRecord
    belongs_to :avaliation
    belongs_to :user

    #Validações
    validates :respond, presence: true
end
