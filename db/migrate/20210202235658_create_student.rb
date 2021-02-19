class CreateStudent < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |s|
      s.string :name
      s.string :cpf
      s.date :birthday
      s.integer :cellphone, limit: 8
      s.string :gender
      s.string :payment_method

      s.timestamps
    end
  end
end
