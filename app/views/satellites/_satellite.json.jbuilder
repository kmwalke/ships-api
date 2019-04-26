json.extract! satellite, :id, :name, :pos_x, :pos_y, :pos_z, :vel_x, :vel_y, :vel_z, :last_updated
json.url satellite_url(satellite, format: :json)
