class PasswordResetsController < ApplicationController
  def new
  end

  def create
    if @user = User.find_by(email: params[:email_address])
      PasswordMailer.with(user: @user).reset.deliver_later
    end
    redirect_to '/login', notice: 'Se o e-mail informado estiver correto, um link será enviado para redefinir sua senha.'
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to '/login', alert: 'Seu token expirou. Favor tentar novamente.'
  end

  def update
  @user = User.find_signed!(params[:token], purpose: 'password_reset')
  if @user.update(password_params)
    redirect_to '/login', notice: 'Senha alterada com sucesso.'
  else
    render 'edit'
  end
  rescue ActiveSupport::MessageVerifier::InvalidSignature
  redirect_to '/login', alert: 'Seu token expirou. Favor tentar novamente.'
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
