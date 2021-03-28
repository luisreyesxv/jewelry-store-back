class UserMailer < ApplicationMailer


    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: "Account Registeration-  #{ Rails.application.credentials[:mail][:frontend_name]}")
    end

    def password_recovery_email(user)
        @user = user
        mail(to: @user.email, subject: "Password Recovery - #{ Rails.application.credentials[:mail][:frontend_name]}")
    end

end
