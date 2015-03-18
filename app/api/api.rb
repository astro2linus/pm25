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
    get 'all-updates' do
      latest_update = PmUpdate.latest
    end

    desc "Return all cities"
    get 'all-cities' do 
      City.all
    end

    desc "Return cities by an array of ids"
    get 'cities' do 
      City.where(id: params[:ids])
    end

    desc "Return pm25 by cities" 
    get 'pm25-by-city' do
      cities = City.where(id: params[:city_ids])
      pm_itmes = []
      cities.map do |city|
        pm_itmes << {city: city, pm25items: city.pm_items.order('created_at DESC').limit(24)}
      end
      pm_itmes
    end
  end
end