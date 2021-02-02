class University < ApplicationRecord

  UNIVERSITY_TYPES = %w(universidade escola creche)

  validates :name, presence: true, uniqueness: true
  validates :cnpj, uniqueness: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :school_type, inclusion: { :allow_nil => true, in: UNIVERSITY_TYPES }
end
