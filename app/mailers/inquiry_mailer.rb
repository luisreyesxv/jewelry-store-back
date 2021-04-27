class InquiryMailer < ApplicationMailer


    def custom_jewelry(inquiry)
        @user = inquiry[:email]
        @details = inquiry
        mail(to: @user, subject: "Custom Inquiry- (#{@details[:firstName]} #{@details[:lastName]})  #{ Rails.application.credentials[:mail][:frontend_name]}")
    end

    def password_recovery_email(user)
        @user = user
        mail(to: @user.email, subject: "Password Recovery - #{ Rails.application.credentials[:mail][:frontend_name]}")
    end

end