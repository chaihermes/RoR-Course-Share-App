class Respond < ApplicationRecord
    belongs_to :avaliation
    belongs_to :user

    #Validações
    validates :respond, presence: true

    #Adicionando friendlyId para deixar a rota da URL mais amigável
    extend FriendlyId
    friendly_id :respond, use: [:slugged, :finders]

    def should_generate_new_friendly_id?
        respond_changed?
    end
    
end
