class CreateInvoice < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |i|
      i.decimal :offered_price
      i.date :due_date
      i.integer :enrollment_id
      i.string :status, default: "Aberta"

      i.timestamps
    end
  end
end
