class CreateIpAddresses < ActiveRecord::Migration
  def change
    create_table :ip_addresses do |t|
      t.integer :address,     null:false, default: 0
      t.string  :mac_address, null:false, default: ''

      t.timestamps null: false
    end
  end
end
