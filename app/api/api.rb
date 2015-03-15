module PM25
  class API < Grape::API
    prefix 'api'
    version 'v1', using: :header, vendor: 'PM25 China'
    format :json

    desc "Return the lastest PM2.5 updates"
    get 'pm25' do
      latest_update = PmUpdate.last
      latest_update.pm_update_items
    end
  end
end