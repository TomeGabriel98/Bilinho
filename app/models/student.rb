class Student < ApplicationRecord
  
  GENDERS = %w(M F)
  PAY_METHOD = %w(Boleto Cartão)

  validates :name, presence: true, uniqueness: true
  validates :cpf, cpf: true, presence: true, uniqueness: true
  validates :gender, inclusion: { :allow_nil => false, in: GENDERS }
  validates :payment_method, inclusion: { :allow_nil => false, in: PAY_METHOD }

end
