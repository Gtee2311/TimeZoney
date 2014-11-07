class SessionsController < ApplicationController
    include SessionsHelper
    
    def new
    end
    
    def create
        @user = User.find_by(email: params[:session][:email].downcase)
        logger.debug @user.to_yaml
        if @user and @user.authenticate(params[:session][:password])
           #valid
           session[:user_id] = @user.id
           redirect_to user_path(@user)
        else #if user is Nil
            #invalid
            flash.now[:error] = 'Invalid username or password combination'
            render 'new'
        end
    end
    
    def destroy
        session.delete(:user_id)
        redirect_to root_path, flash: {success: 'Logged out!' }
    end
end