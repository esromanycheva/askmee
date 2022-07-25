class ApplicationController < ActionController::Base
  helper_method :current_user

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def redirect_with_alert
    redirect_to root_path, alert: 'Вам сюда нельзя'
  end

  def render_404
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404.html", layout: false, status: :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end
end
