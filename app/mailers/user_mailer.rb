class UserMailer < ApplicationMailer
  default from: 'noreply@gdscptit.dev'

  def request_new_user
    @name = params[:name]
    @email = params[:email]

    mail(to: @email, subject: I18n.t('mailer.user.title'))
  end
end
