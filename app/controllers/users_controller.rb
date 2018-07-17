class UsersController < ApplicationController
    skip_before_action :authorize_request, only: :create, :raise => false
    # before_action :set_user, only: [:me, :update, :destroy]
    
    def allUser
      @user = User.unscoped.all
      json_response(@user.order("RANDOM()"))
    end

    def me
      @user = current_user
      json_response(@user)
    end

    def meAvatar
      @user = current_user
      json_response(@user)
    end

    def create
      user = User.create!(user_params)
      auth_token = AuthenticateUser.new(user.email, user.password).call
      response = { message: Message.account_created, auth_token: auth_token }
      json_response(response, :created)
    end

    # PUT /users/:id
    def update
      @user = current_user
      @user.update_attributes(user_params)
      head :no_content
    end

    def updateUser
      user = User.find(params[:id])
      user.update_attributes(user_params)
      json_response(user)
    end

    def getUser
      user = User.find(params[:id])
      json_response(user)
    end

    # DELETE /strolls/:id
    # def destroy
    #   @user.destroy
    #   head :no_content
    # end
  
    private
  
    def user_params
      params.permit(
        :picture,
        :name,
        :email,
        :password,
        :password_confirmation,
        :is_active
      )
    end
  end