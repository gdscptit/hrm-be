module UserHelper
  def is_authenticated?
    session[:user].present?
  end
end
