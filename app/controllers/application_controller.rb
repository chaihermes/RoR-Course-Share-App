class ApplicationController < ActionController::Base
  #Se eu deixo o protect_from_forgery descomentado, não consigo deslogar, aponta um erro que não consegui entender.
  #protect_from_forgery with: :exception
  include CurrentCart
  before_action :set_cart
end
