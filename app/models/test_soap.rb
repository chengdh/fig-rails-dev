#coding: utf-8
class TestSoap
  extend Savon::Model
  client wsdl: "http://192.168.1.120:5000/soap?wsdl"
  operations :echo,:sum
end
