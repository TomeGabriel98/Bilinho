class CreateUniversity < ActiveRecord::Migration[6.1]
  def change
    create_table :universities do |u|
      u.string :name
      u.string :cnpj
      u.string :school_type

      u.timestamps
    end
  end
end
