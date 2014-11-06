# encoding: utf-8

class Mernis
  def self.sorgula(id_number, first_name, last_name, birth_year, 
    version = 2, open_timeout = 60, read_timeout = 60, log = true,
    wsdl: 'https://tckimlik.nvi.gov.tr/Service/KPSPublic.asmx?WSDL')
    response = Request.new(id_number, first_name, last_name, birth_year, version, open_timeout, read_timeout, log, wsdl)
    response.sorgula
  end
end

require 'mernis/request'