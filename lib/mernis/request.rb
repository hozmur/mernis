# encoding: utf-8

require 'savon'

class Request
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

  def sorgula
    kps_client = Savon.client(
      wsdl: @wsdl,
      soap_version: @version,
      open_timeout: @open_timeout,
      read_timeout: @read_timeout,
      log: @log
    )

    message = {
      "TCKimlikNo" => @id_number,
      "Ad" => @first_name,
      "Soyad" => @last_name,
      "DogumYili" => @birth_year
    }

    response = kps_client.call(:tc_kimlik_no_dogrula, message: message)
    bool_value = response.body[:tc_kimlik_no_dogrula_response][:tc_kimlik_no_dogrula_result]

    return bool_value
  end
end