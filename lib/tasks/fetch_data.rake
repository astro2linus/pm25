require 'net/http'
require 'uri'

desc "Import PM 2.5 data"
task :import_data => :environment do
  uri = URI.parse"http://ef.pjq.me/download/pm25/all_city/pm25_all.txt"
  res = Net::HTTP.get_response(uri)

  update = PmUpdate.create
  res.body.force_encoding("UTF-8").split("\n").each do |record|
    city, pm25 = record.split(" ")
    PmUpdateItem.create(
    {
      pm_update: update,
      city: city,
      pm25: pm25.to_i
    })
    
  end
 
end