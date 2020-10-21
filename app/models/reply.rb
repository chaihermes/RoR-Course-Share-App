class Reply < ApplicationRecord

    belongs_to :discussion
    belongs_to :user

    #Validaçẽos
    validates :reply, presence: true
end
