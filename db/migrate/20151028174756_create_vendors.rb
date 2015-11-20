class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.integer :number_i_booth
      t.integer :booth_i_cost
      t.integer :number_o_booth
      t.integer :booth_o_cost
      t.boolean :booth_pref
      t.integer :length
      t.integer :width
      t.integer :booth_cost
      t.integer :electric
      t.integer :electric_cost
      t.integer :ext_chairs
      t.integer :chair_cost
      t.integer :ext_tables
      t.integer :table_cost
      t.integer :service_cost
      t.integer :total_cost
      t.string :company_name
      t.string :product
      t.string :contact_name
      t.string :contact_title
      t.string :address_street
      t.string :address_city
      t.string :address_state
      t.string :address_zip
      t.string :phone
      t.string :fax
      t.string  :authorize_sig
      t.string :authorize_title
      t.string :authorize_date
      t.boolean :inovice_sent
      t.boolean :bill_paid
      t.boolean :confirmation_sent
      t.integer :vendor_id
      t.boolean :session_state
      t.boolean :admin
      t.string :email
      t.string :custom_description
      t.string :service_description
    end
  end
end
