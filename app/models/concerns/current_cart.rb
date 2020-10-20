module CurrentCart

    private
  
    def set_cart
        #encontra o carrinho através da session
      @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
        #se não encontrar, vai fazer o carrinho através da session
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end

  end