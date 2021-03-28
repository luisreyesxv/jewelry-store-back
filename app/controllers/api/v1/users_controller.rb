class API::V1::UsersController < AuthorizationController
    skip_before_action :authorized, only: [:index, :register, :login]
    
    def index
        # cookies.signed[:jwt] = {value: "this is the new cookie from visiting user with expiration time", httponly: true, expires: 10.second.from_now}
        # cookies.delete(:jwt)
        users = User.all
        render json:users
    end

    def show
        user = User.find_by(name: params[:id])
        render json: user
    end


    def register
        user = User.create(user_params)

        if user.valid?
            create_token(user)
            UserMailer.welcome_email(user).deliver_now
            render json: user
        else
            render json: {error: "Issue with registering an account. Please try again"}
        end

    end


    def login
        user = User.find_by(email: user_params[:email])

        if user && user.authenticate(user_params[:password])
            create_token(user)
            render json: user
        else
            render json: {error: "User/password combination does not exist, Please Try Again"}, status: :unauthorized
        end
    end

    def session
        user = logged_in_user

        if user
            create_token(user)
            render json: user
        else
            render json: {error: "User/password combination does not exist, Please Try Again"}, status: :unauthorized
        end

    end

    def logout

        cookies.delete(:jwt)
        render head: :ok
    end

    private
    def user_params
        params.require(:user).permit(:name,:password,:email)
    end

    def create_token(user)
        token= encode_token(user_id: user.id)
        cookies.signed[:jwt] = {value: token, httponly: true, expires: 4.hour.from_now}
    end
   
end
