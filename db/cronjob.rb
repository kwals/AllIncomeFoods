#!/usr/bin/env ruby
require 'net/http'

Net::HTTP.start("www.snapretailerlocator.com") { |http|
  states = ["AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA", "GU", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI", "MN",
            "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VA", "VI", "VT", "WA",
            "WI", "WV", "WY"]
  $i = 0;
  $num = 50;
  while $i < $num  do
    resp = http.get("/export/" + states[$i] + ".zip")
    open(states[$i] + ".zip", "wb") { |file|
    file.write(resp.body)
    }
    $i +=1;
  end 
}
puts "Done Importing!!"