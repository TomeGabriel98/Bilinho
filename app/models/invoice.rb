class Invoice < ApplicationRecord
  STATUSES = %w(Aberta Atrasada Paga)

  belongs_to :enrollment, optional: false

  validates :offered_price, presence: true
  validates :due_date, presence: true
  validates :status, inclusion: { :allow_nil => false, in: STATUSES }
end
