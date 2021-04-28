class InquiryMailer < ApplicationMailer


    def custom_jewelry(inquiry)
        @user = inquiry[:email]
        @details = inquiry
        mail(to: @user, bcc: "boogermcpoopypants@gmail.com" ,subject: "Custom Inquiry- (#{@details[:firstName]} #{@details[:lastName]})  #{ Rails.application.credentials[:mail][:frontend_name]}")

    end

    def repair(inquiry)
        @user = inquiry[:email]
        @details = inquiry
        mail(to: @user, bcc: "boogermcpoopypants@gmail.com", subject: "Repair Inquiry- (#{@details[:firstName]} #{@details[:lastName]})  #{ Rails.application.credentials[:mail][:frontend_name]}")
    end

    def repurpose(inquiry)
        @user = inquiry[:email]
        @details = inquiry
        mail(to: @user, bcc: "boogermcpoopypants@gmail.com", subject: "Repurpose Jewelry Inquiry- (#{@details[:firstName]} #{@details[:lastName]})  #{ Rails.application.credentials[:mail][:frontend_name]}")
    end

end