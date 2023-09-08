class PagesController < ApplicationController
  before_action :require_login, only: [:home]

  def home
    @tasks = Task.all
    current_user_id = current_user.id
    user = User.find(current_user_id)
    user_name = user.name
    @task = user_name
  end

  private

  def require_login
    unless user_signed_in? # Vous pouvez utiliser 'user_signed_in?' pour vérifier si l'utilisateur est connecté
      redirect_to new_user_session_path, alert: "Vous devez vous connecter pour accéder à cette page."
    end
  end
end
