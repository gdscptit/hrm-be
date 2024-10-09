# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :redirect_if_authenticated

  def sign_in
  end

  def create_session
    return redirect_back(fallback_location: request.referer) if params[:password] != params[:password_confirmation]

    user = User.find_by_email(params[:email])
    return redirect_back(fallback_location: request.referer) if user.nil?

    return redirect_back(fallback_location: request.referer) unless user.authenticate(params[:password])

    session[:user] = { email: user.email, role: user.role }
    redirect_back(fallback_location: request.referer)
  end
end
