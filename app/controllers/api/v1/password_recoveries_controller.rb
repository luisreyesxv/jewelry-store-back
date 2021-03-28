class API::V1::PasswordRecoveriesController < ApplicationController




    def forgot
        if params[:email].blank?
            return render json: {error: "Email not present"}
        end

        user = User.find_by(email: password_params[:email])

        if user
            user.generate_password_token!
            UserMailer.password_recovery_email(user).deliver_now
            render json: {status: 'ok'}, status: :ok
        else
            render json: {error: "Email Address not found. Please check and try again."}
        end

    end


    def reset
        token = params[:token].to_s

        if params[:email].blank?
            return render json: {error: "Token not present"}
        end

        user = User.find_by(reset_password_token: token)

        if user && user.password_token_valid?
            if user.reset_password!(params[:password])
                render json: {status: "ok"}, status: :ok
            else
                render json: {error: "issue with creating password. Please make sure it follows password instructions"}, status: :unprocessable_entity
            end
        else
            render: {error: "Link not valid or has expired. Try generating a new link."}, status: :not_found
        end


    end




    private

    def password_params
        params.require(:password_recovery).permit(:email,:token)

    end

end
