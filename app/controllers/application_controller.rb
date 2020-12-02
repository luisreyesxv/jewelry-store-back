class ApplicationController < ActionController::API
    before_action :authorized

    
    
    def encode_token(payload)
        JWT.encode(payload, Rails.application.credentials.jwt_token,"HS256", {typ:"JWT"})
    end




    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            #Authorization header should look something like "Bearer <blahblahlblahblah>"
            token= auth_header.split(" ")[1]
            # byebug
            begin
                JWT.decode(token, Rails.application.credentials.jwt_token, true, algorithm: "HS256")
                # JWT.decode => [{ "user_id"=>"2" }, { "alg"=>"HS256" }]
              rescue JWT::DecodeError
                nil
            end
        end
    end



    def logged_in_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find(user_id)
        end    
    end


    def logged_in?
        return !!logged_in_user
    end


    def authorized
        render json: {message: 'Please Log In'}, status: :unauthorized unless logged_in?

    end


# this would be the method i want to use to see if user is "logged in" and is also an admin instead of running authorized. Currently need to change the last thing
# to check something besides a specific user id
    def administrator?
        render json: {message: "You must contact the administrator for the right to see this"}, status: :unauthorized unless logged_in? && logged_in_user.id == 19
    end

end

