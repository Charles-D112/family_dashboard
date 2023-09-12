class List < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  belongs_to :existing_task, class_name: 'Task', foreign_key: 'existing_task_id', optional: true

  attr_accessor :generic_tasks, :task_names
end
