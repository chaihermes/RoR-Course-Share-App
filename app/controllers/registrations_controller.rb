class RegistrationsController < Devise::RegistrationsController

    private
    
    #para novos usuários (nativo do Devise - sign_up_params e account_update_params). Requer username, email e senha para os usuários novos e pra atualizar a conta:
    def sign_up_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
  
    def account_update_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
    end
  
  end