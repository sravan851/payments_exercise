class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.decimal :amount, precision: 8, scale: 2
      t.datetime :date
      t.references :loan, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
