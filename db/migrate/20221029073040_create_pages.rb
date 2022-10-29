class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      t.string :first_name
      t.string :last_name
      t.text :about

      t.timestamps
    end
  end
end
