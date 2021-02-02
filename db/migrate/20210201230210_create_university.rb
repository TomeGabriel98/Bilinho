class CreateUniversity < ActiveRecord::Migration[6.1]
  def change
    create_table :universities do |t|
      t.string :name
      t.string :cnpj
      t.string :school_type

      t.timestamps
    end
  end
end
