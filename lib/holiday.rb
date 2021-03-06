require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash [:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
    holiday_hash[:winter][:christmas] << supply
    holiday_hash[:winter][:new_years] << supply
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day]<< supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  holiday_hash[season][holiday_name] = supply_array
  # remember to return the updated hash
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  output = holiday_hash[:winter].collect do |holiday,supply|
    supply
  end
  output.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_supplies.each do |season,value|
    puts "#{season.to_s.capitalize}:" #season only needs to capitalize first letter

    holiday_supplies[season].each do | holiday, supply|
      supply_output = supply.join(", ")

      holiday_string= holiday.to_s
      if holiday_string.include?("_")
        arr = holiday_string.split("_") #into an array of words
        cap_arr = arr.collect do |word|
          word.capitalize
        end #each word capitalize, return modified results
        holiday_output = cap_arr.join(" ") #join array into string
      else
        holiday_output =holiday_string.capitalize #no _ word
      end

      puts "  #{holiday_output}: #{supply_output}"
    end
  end

end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  output = []
  holiday_hash.each do |season, holiday|
    holiday_hash[season].collect do |holiday, supply|
      output << holiday if supply.include?("BBQ")
    end
  end
  output
end
