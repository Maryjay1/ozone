class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'
    @url = 'http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=20002&distance=0&API_KEY=B2B6E09C-D478-4E7D-BA26-B434A5A2D3B4'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    #CHECK FOR EMPTY RETURN RESULT
    if @output.empty?
        @final_output = "ERROR"
    elsif !@output
      @final_output = "ERROR"

    else
    @final_output = @output[0]['AQI']
    end

  end
end
