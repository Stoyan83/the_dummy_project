class RemoveOtherLingNameFromPages < ActiveRecord::Migration[7.0]
  def change
    remove_column :pages, :other_ling_name, :string
  end
end
