class API::V1::InquiryController < ApplicationController

    def custom_work
        InquiryMailer.custom_jewelry(inquiry_params).deliver_now


    end


    private
    def inquiry_params
        params.require(:inquiry).permit(:firstName, :lastName, :email, :budget, :diamond, :material, :description)
    end
end