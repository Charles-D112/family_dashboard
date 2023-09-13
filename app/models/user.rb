class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :lists
  has_many :meetings
  has_one_attached :photo

  def my_executed_tasks
    @executed_tasks = Task.where(executor: self, done: true)
    self.total_points = 0
    @executed_tasks.each do |task|
      self.total_points += 1
    end
    self.total_points
  end
end
