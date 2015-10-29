class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.integer :number_i_booth
      t.integer :number_o_booth
      t.boolean :booth_pref
      t.integer :booth_cost
      t.boolean :electric
      t.boolean :internet
      t.boolean :forklift
      t.integer :ext_chairs
      t.integer :ext_tables
      t.integer :service_cost
      t.string :company_name
      t.string :product
      t.string :contact_name
      t.string :address_street
      t.string :address_city
      t.string :address_state
      t.integer :address_zip
      t.string :phone
      t.string :fax
      t.boolean :authorize_sig
      t.string :authorize_title
      t.date :authorize_date
      t.boolean :inovice_sent
      t.boolean :bill_paid
      t.boolean :confirmation_sent
      t.integer :vendor_id
      t.boolean :session_state
      t.boolean :admin
    end
  end
end
