class AddColumnToPages < ActiveRecord::Migration[7.0]
  def change
    add_column :pages, :gender, :string
    add_column :pages, :birthday, :date
    add_column :pages, :current_address, :string
    add_column :pages, :telephone_number, :string
    add_column :pages, :email, :string
    add_column :pages, :other_links, :string
    add_column :pages, :other_ling_name, :string
    add_column :pages, :education, :string
    add_column :pages, :education_start_date, :date
    add_column :pages, :education_end_date, :date
    add_column :pages, :education2, :string
    add_column :pages, :education2_start_date, :date
    add_column :pages, :education2_end_date, :date
    add_column :pages, :experience, :string
    add_column :pages, :experience_start_date, :date
    add_column :pages, :experience_end_date, :date
    add_column :pages, :experience2, :string
    add_column :pages, :experience2_start_date, :date
    add_column :pages, :experience2_end_date, :date
    add_column :pages, :experience3, :string
    add_column :pages, :experience3_start_date, :date
    add_column :pages, :experience3_end_date, :date
    add_column :pages, :experience4, :string
    add_column :pages, :experience4_start_date, :date
    add_column :pages, :experience4_end_date, :date
  end
end
