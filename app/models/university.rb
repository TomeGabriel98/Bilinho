class University < ApplicationRecord
  UNIVERSITY_TYPES = %w(Universidade Escola Creche)

  validates :name, presence: true, uniqueness: true
  validates :cnpj, uniqueness: true, cnpj: true, allow_nil: true
  validates :school_type, inclusion: { :allow_nil => true, in: UNIVERSITY_TYPES }
end
