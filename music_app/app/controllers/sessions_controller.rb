class SessionsController < ApplicationController
    def create
        @user = User.find_by_credentials(params[:user][:email],params[:user][:password])
        if @user 
            login!(@user)
            redirect_to user_url(@user.id)
        else
            flash.now[:errors] = ['Incorrect email/password!']
            render :new
        end
    end

    def new
        @user = User.new
    end

    def destroy
        logout!
        redirect_to new_session_url
    end

    

end
