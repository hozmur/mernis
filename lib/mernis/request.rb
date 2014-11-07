# encoding: utf-8

require 'savon'

class Request
  # Initialize params.
  def initialize(id_number, first_name, last_name, birth_year, version, open_timeout, read_timeout, log, wsdl)
    @id_number = id_number
    @first_name = first_name
    @last_name = last_name
    @birth_year = birth_year
    @version = version
    @open_timeout = open_timeout
    @read_timeout = read_timeout
    @log = log
    @wsdl = wsdl
  end

  # Initialize the SOAP client
  def sorgula
    kps_client = Savon.client(
      wsdl: @wsdl,
      soap_version: @version,
      open_timeout: @open_timeout,
      read_timeout: @read_timeout,
      log: @log
    )

  # Create message pattern
    message = {
      "TCKimlikNo" => @id_number.to_s,
      "Ad" => @first_name,
      "Soyad" => @last_name,
      "DogumYili" => @birth_year.to_s
    }

  # Make the SOAP request and handle errors.
    begin
      response = kps_client.call(:tc_kimlik_no_dogrula, message: message)
    rescue Savon::SOAPFault => error
      puts "SOAP fault. Error: #{error}"
    rescue Savon::HTTPError => error
      puts "HTTP connection error. Error: #{error}"
    end

  # Get the SOAP response and handle errors.
    begin
      bool_value = response.body[:tc_kimlik_no_dogrula_response][:tc_kimlik_no_dogrula_result]
      return bool_value
    rescue NoMethodError => error
      response.nil? ? (puts "Errors occured. Response is nil! Error: #{error}") : (puts "There is an error with the response. Error: #{error}")
    rescue Savon::InvalidResponseError => error
      puts "Not a valid response! Error: #{error}"
    end
  end
end


## argüman sayısında hata varsa veya veri tipinde hata varsa onuda yakala!