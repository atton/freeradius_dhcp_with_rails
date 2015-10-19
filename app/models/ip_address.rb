class IpAddress < ActiveRecord::Base
  validates_presence_of   :mac_address, :address
  validates_uniqueness_of :mac_address, :address

  validates_inclusion_of  :address,     in:   0..254
  validates_format_of     :mac_address, with: /\A([0-9a-f]{2}:){5}([0-9a-f]{2})\z/
end
