class AddCarToPages < ActiveRecord::Migration[7.0]
  def change
    add_reference :pages, :user, index: true
  end
end
