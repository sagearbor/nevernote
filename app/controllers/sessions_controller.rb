class SessionsController < ApplicationController
  layout 'landing'

  def new
    @user = User.new
  end

  def create
    @user = User.find_by username: params[:user][:username]
    if @user.present? && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_url, notice: t('session.flash.create.success')
    else
      @user = User.new username: params[:user][:username]
      flash.now.alert = t('session.flash.create.failure')
      render :new
    end
  end

  def destroy
    if session[:user_id]
      session[:user_id] = nil
      redirect_to login_path, notice: t('session.flash.destroy.success')
    else
      redirect_to login_path, notice: t('session.flash.destroy.failure')
    end
  end
end
