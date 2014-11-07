class UsersController < ApplicationController
    def index
        @search_term = params[:user][:search_term] if params[:user] and params[:user][:search_term]
        if @search_term
            #search
            @users = User.where('email LIKE :term OR name LIKE :term', term: '%' + @search_term + '%')
        else
            @users = User.all
        end
    end
    
    def new
         @user = User.new
    end
    
    def create
         @user = User.new(user_params)
        
        if @user.save
            #success
            redirect_to user_path(@user), notice: {success: 'Successfully signed up' }
        else
            #fail
            flash.now[:error] = 'Invalid Input. Please try again!'
            render 'new'
        end
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
         @user = User.find(params[:id])
        
        if @user.update(user_params)
            #success
            redirect_to user_path(@user), flash: {success: 'Successfully Updated' }
        else
            #fail
            flash.now[:error] = 'Failed to update details!'
            render 'new'
        end
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    private
        def user_params
            params.require(:user).permit(:name,
                                         :email,
                                         :password,
                                         :password_confirmation)
        end
end
