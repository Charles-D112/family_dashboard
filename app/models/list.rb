class List < ApplicationRecord
  belongs_to :user
  has_many :tasks
  belongs_to :existing_task, class_name: 'Task', foreign_key: 'existing_task_id', optional: true

  validate :one_task_minimum, on: :update

  private

  def one_task_minimum
    errors.add(:base, "Ajoutez une tâche au minimum pour valider!") if tasks.empty?
  end

  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true
end
