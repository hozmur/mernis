# encoding: utf-8

class Mernis
  # Most basic usage:
    # Mernis.sorgula("12345", "John", "Doe", "1990")
  # Advanced usage:
    # Mernis.sorgula(id_number="12345", first_name="John", last_name="Doe", birth_year="1990")
    # Mernis.sorgula(id_number="12345", first_name="John", last_name="Doe", birth_year="1990", version = 2, log = false)
  # Full usage:
    # Mernis.sorgula(id_number="12345", first_name="John", last_name="Doe", birth_year="1990",
      # version = 2, open_timeout = 60, read_timeout = 60, log = false,
      # wsdl: 'https://somecustomwsdl.com' )

  def self.sorgula(id_number, first_name, last_name, birth_year, 
    version = 2, open_timeout = 60, read_timeout = 60, log = true,
    wsdl = "https://tckimlik.nvi.gov.tr/Service/KPSPublic.asmx?WSDL")
    response = Request.new(id_number, first_name, last_name, birth_year, version, open_timeout, read_timeout, log, wsdl)
    response.sorgula
  end
end

require 'mernis/request'