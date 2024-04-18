class UsersController < ApplicationController
    
    def create
        user = User.new(user_params)

        if user.save
            render json: UserBlueprint.render(user, view: :normal), status: :created   
        else
            render json: user.errors, status: :unprocessable_entity    
        end
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)

        if @user.update(user_params)
            render json: UserBlueprint.render(@user, view: :normal), status: :ok
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy

        if @user.destroy
            render json: nil, status: :ok
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
    end
end
