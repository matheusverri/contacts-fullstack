class UsersController < ApplicationController
  def new
      @user = User.new
  end

  def create
      @user = User.new(user_params)
      if @user.save!
        session[:user_id] = @user.id
        redirect_to root_url, notice: "Registrado com sucesso!"
      else
        render :new
      end
  end

  def delete
  end

  def destroy
    user = current_user
    if user && user.authenticate(params[:password])
      current_user.destroy
      session[:user_id] = nil
      redirect_to signup_path, notice: "Sua conta foi excluída com sucesso."
    else
      redirect_to root_url, alert: "Senha incorreta. Por favor, tente novamente."
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
