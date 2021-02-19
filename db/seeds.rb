Student.create(
  name: FFaker::Name.name,
  cpf: FFaker::IdentificationBR.pretty_cpf,
  gender: "M",
  payment_method: "Boleto",
  birthday: FFaker::Time.between(16.years.ago, Date.today),
  cellphone: FFaker::PhoneNumberBR.mobile_phone_number
)

University.create(
  name: FFaker::Company.name,
  cnpj: FFaker::IdentificationBR.pretty_cnpj,
  school_type: 'Universidade'
)
