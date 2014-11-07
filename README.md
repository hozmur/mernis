# MERNİS (KPS)

SOAP client for KPS (The Identity Information Sharing System) services provided by Ministry of the Interior, Turkey

[![Gem Version](https://badge.fury.io/rb/mernis.svg)](http://badge.fury.io/rb/mernis)
[![Code Climate](https://codeclimate.com/github/msdundar/mernis/badges/gpa.svg)](https://codeclimate.com/github/msdundar/mernis)

## Setup

```
$ gem install 'mernis'
```

## Usage Examples

```ruby
require 'mernis'

# Most basic usage:
mernis = Mernis.sorgula("12345", "John", "Doe", "1990")

# With parameter names (required only):
mernis = Mernis.sorgula(id_number="12345", first_name="John", last_name="Doe", birth_year="1990")

# With parameter names (required + extras):
mernis = Mernis.sorgula(id_number="12345", first_name="John", last_name="Doe", birth_year="1990", version = 2, log = false)

# With all parameters:
mernis = Mernis.sorgula(id_number="12345", first_name="John", last_name="Doe", birth_year="1990", version = 2, open_timeout = 60, read_timeout = 60, log = false, wsdl = "https://somecustomwsdl.com" )

```

## Parameters

```ruby
mernis = Mernis.sorgula(
      id_number="12345", # identity number
      first_name="John", # first name
      last_name="Doe",   # last name
      birth_year="1990", # year of birth
      version = 2,       # soap version. should be 1 or 2.
      open_timeout = 60, # timeout duration until SOAP server opens the connection. in seconds.
      read_timeout = 60, # timeout duration until SOAP server returns response. in seconds.
      log = false,       # logging
      wsdl = "https://somecustomwsdl.com" # wsdl uri
    )
```

## Response

Returns true if the identity number can be validated and false if not. Both returning values are string!

## Questions

```
msdundars@gmail.com
```