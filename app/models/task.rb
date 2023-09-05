class Task < ApplicationRecord
  belongs_to :list, optional: true
  belongs_to :executor, class_name: "User", optional: true
  belongs_to :owner, class_name: "User"
  belongs_to :tuto, optional: true
end
