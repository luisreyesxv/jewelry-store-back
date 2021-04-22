class OrderMailer < ApplicationMailer

    def receipt(user,items, quantity)
        @user = user
        @items = items
        @quantity = quantity

        mail(to: @user.email, subject: "Thank You For Your Purchase-  #{ Rails.application.credentials[:mail][:frontend_name]}")


    end
end
