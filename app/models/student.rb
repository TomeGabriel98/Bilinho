class Student < ApplicationRecord
  
  GENDERS = %w(M F)
  PAY_METHOD = %w(Boleto Cartão)

  validates :name, presence: true, uniqueness: true
  validates :cpf, uniqueness: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: false
  validates :gender, inclusion: { :allow_nil => false, in: GENDERS }
  validates :payment_method, inclusion: { :allow_nil => false, in: PAY_METHOD }

end
