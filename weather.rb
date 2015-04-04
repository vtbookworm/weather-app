require 'nokogiri'
require 'yahoo_weatherman'

#--------------------------------------
# method get-today
#
# accepts a zip code and gets today's
# forecast
#--------------------------------------
def get_weather(this_zip)

	new_hash = {:unit=>"f"}
	client = Weatherman::Client.new(new_hash)
	weather_obj = client.lookup_by_location(this_zip) 
	
	i = 1
	weather_obj.forecasts.each do |forecast|
		if (i == 1) 
			datestr = "Today"
		
		elsif (i ==2) 
			datestr = "Tomorrow"
		
		else 
			datestring = forecast["day"]
			datestr = case datestring
				when "Mon" then "Monday"
				when "Tue" then "Tuesday"
				when "Wed" then "Wednesday"
				when "Thu" then "Thursday"
				when "Fri" then "Friday"
				when "Sat" then "Saturday"
				else "day unknown"
			end
		end
	
		puts datestr + " is going to be " + forecast["text"].downcase + " with a high of " + forecast["high"].to_s + "\nand a low of " + forecast["low"].to_s + " degrees Fahrenheit."
		i += 1
	end
	# puts client.methods
	
end


#--------------------------------------
# Main
#--------------------------------------
puts "Please enter your zip code:"
zip = gets.chomp
weather = get_weather(zip)

