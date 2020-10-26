module AvaliationsHelper

    def avaliation_author(avaliation)
        user_signed_in? && current_user.id == avaliation.user_id
    end

    def respond_author(respond)
        user_signed_in? && current_user.id == respond.user_id
    end
end
