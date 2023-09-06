class List < ApplicationRecord
  belongs_to :user
  has_many :tasks

  validate :one_task_minimum, on: :update

  private

  def one_task_minimum
    errors.add(:base, "Ajoutez une tâche au minimum pour valider!") if tasks.empty?
  end
end
