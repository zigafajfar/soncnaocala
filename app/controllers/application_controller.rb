class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private
	  def true_cart
			@true_cart ||= Cart.find(cookies.signed[:cart]) if cookies.signed[:cart]
		end
		helper_method :true_cart

		def authenticate_cart
			redirect_to root_path unless true_cart == Cart.find(params[:id])
		end

		def cart_exists?
			redirect_to root_path unless true_cart
		end
end
