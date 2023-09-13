class PagesController < ApplicationController
  before_action :require_login, only: [:home]

  def home
    @tasks = Task.all
    @user_name = current_user.name
  end

  private

  def require_login
    unless user_signed_in? # Vous pouvez utiliser 'user_signed_in?' pour vérifier si l'utilisateur est connecté
      redirect_to new_user_session_path, alert: "Vous devez vous connecter pour accéder à cette page."
    end
  end
end
