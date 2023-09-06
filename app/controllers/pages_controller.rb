class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @show_footer = false # Vous pouvez définir cette variable selon vos besoins initiaux
  end
end
