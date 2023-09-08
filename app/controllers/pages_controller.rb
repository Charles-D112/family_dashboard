class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @tasks = Task.all
<<<<<<< HEAD
    @task = current_user.name
=======
    # @task = current_user.name
>>>>>>> master
  end
end
