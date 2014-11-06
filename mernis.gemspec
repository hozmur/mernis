Gem::Specification.new do |s|
  s.name        = "mernis"
  s.version     = "0.0.3"
  s.platform    = Gem::Platform::RUBY
  s.date        = Time.now.strftime("%Y-%m-%d")
  s.summary     = "SOAP client for KPS services."
  s.description = "SOAP client for KPS (The Identity Information Sharing System) services provided by Ministry of the Interior, Turkey"
  s.author      = "Mustafa Serhat Dündar"
  s.email       = "msdundars@gmail.com"
  s.files       = ["lib/mernis.rb", "lib/mernis/request.rb"]
  s.homepage    = "https://github.com/msdundar/mernis"
  s.licenses    = ["MIT"]
  s.add_dependency 'savon', '~> 2.7.2'
end