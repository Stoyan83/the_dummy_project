class AddTypeToPages < ActiveRecord::Migration[7.0]
  def change
    add_column :pages, :page_type, :string
  end
end
