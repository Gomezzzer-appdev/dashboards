class CurrenciesController < ApplicationController
  def first_currency

    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")

    @array_of_symbols =  @symbols_hash.keys
    render({ :template => "currency_templates/step_one.html.erb" })
  end

  def second_currency

    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")

    @array_of_symbols =  @symbols_hash.keys

    # params are 
    # Parameters: {"from_currency"=>"ARS"}


    @from_symbol = params.fetch("from_currency")

    render({ :template => "currency_templates/step_two.html.erb" })
  
end

def third_currency
  
  @raw_data = open("https://api.exchangerate.host/symbols").read
  @parsed_data = JSON.parse(@raw_data)
  @symbols_hash = @parsed_data.fetch("symbols")

  @array_of_symbols =  @symbols_hash.keys
  @from_symbol = params.fetch("from_currency")
  @conversion = params.fetch("conversion")

  @conversion_raw_data = open("https://api.exchangerate.host/convert?from=USD&to=EUR").read
  @conversion_parsed_data = JSON.parse(@conversion_raw_data)
  @conversion_rate = @conversion_parsed_data.fetch("info")
  @final_conversion_rate = @conversion_rate.fetch("rate")
  
  

  render({ :template => "currency_templates/step_three.html.erb" })


 end
end
        


  
