require './station'
require 'typhoeus'
require 'debugger'
require 'json'

class BikeParser
  def initialize(file_name)
    @file_name = file_name
  end

  def call
    DataMapper.auto_migrate!
    response = Typhoeus.get(@file_name)
    
    # debugger
    
    parsed = JSON.parse(response.body)
    parsed["stationBeanList"].each do |station|
      Station.create(station)
    end
  end
end


   # stations = File.open(@file_name).read
    # @data = MultiJson.load(stations)
    # @data.each do |station|
    #   station2= Hash.new
    #   station.each do |k, v|
    #     station2[k.to_sym] = v
    #   end
    #   Station.create(station2)
    # end