module PM25
  class API < Grape::API
    prefix 'api'
    version 'v1', using: :header, vendor: 'PM25 China'
    format :json

    before do
      header "Access-Control-Allow-Origin", "*"
    end

    desc "Return the lastest PM2.5 updates"
    get 'pm25' do
      latest_update = PmUpdate.last
      latest_update.pm_update_items
    end

    desc "Return latest 10 importing data records"
    get 'updates' do
      latest_update = PmUpdate.latest
    end
  end
end