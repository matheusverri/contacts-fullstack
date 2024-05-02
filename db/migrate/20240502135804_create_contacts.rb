class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :cpf
      t.string :phone_number
      t.string :cep
      t.string :address
      t.string :lat
      t.string :lng

      t.timestamps
    end
  end
end
