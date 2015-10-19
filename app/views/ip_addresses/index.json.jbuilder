json.array!(@ip_addresses) do |ip_address|
  json.extract! ip_address, :id, :address, :mac_address
  json.url ip_address_url(ip_address, format: :json)
end
