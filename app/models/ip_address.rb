class IpAddress < ActiveRecord::Base
  has_one :radius_check_information
  has_one :radius_reply_information

  validates_presence_of   :mac_address, :address
  validates_uniqueness_of :mac_address, :address

  validates_inclusion_of  :address,     in:   0..254
  validates_format_of     :mac_address, with: /\A([0-9a-f]{2}:){5}([0-9a-f]{2})\z/

  def ipv4
    IPv4Prefix + address.to_s
  end

  after_save do
    rad_check = radius_check_information || create_radius_check_information
    rad_check.mac_address = mac_address

    rad_reply = radius_reply_information || create_radius_reply_information
    rad_reply.mac_address = mac_address
    rad_reply.value       = ipv4

    [rad_check, rad_reply].all?{|i| i.save}
  end
end
