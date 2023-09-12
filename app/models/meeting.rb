class Meeting < ApplicationRecord
  belongs_to :user

  def multi_days?
    (end_time.to_date - start_time.to_date).to_i >= 1
  end
end
