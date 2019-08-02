require 'aws-record'
require 'httparty'
require 'json'

aws_id = ''
secret_key =''

Aws.config.update({
  region: 'eu-west-2',
  credentials: Aws::Credentials.new(aws_id, secret_key)
})

class Currency
  include Aws::Record
  integer_attr :id, hash_key: true
  string_attr  :base
  float_attr   :aud
  float_attr   :mad
end

def fetch_handler(event:, context:)
  api_key = ''
  response = HTTParty.get("http://data.fixer.io/api/latest?access_key=#{api_key}&symbols=AUD,MAD&format=1")
  body = JSON.parse(response.body)
  currency = Currency.find(id: body['timestamp'], base: body['base']) || Currency.new(id: body['timestamp'], base: body['base'])
  currency.aud = body['rates']['AUD']
  currency.mad = body['rates']['MAD']
  currency.save

  {
    statusCode: 200,
    body: currency.to_h.to_json
  }
end

def list_handler(event:, context:)
  scan = Currency.build_scan.complete!
  body = {
    labels: scan.map { |item| Time.at(item.id) },
    mad: scan.map { |item| { x: item.id, y: item.mad } },
    aud: scan.map { |item| { x: item.id, y: item.aud } },
  }

  {
    statusCode: 200,
    body: body.to_json,
    headers: {
      "Access-Control-Allow-Headers" => 'Content-Type',
      "Access-Control-Allow-Origin" => 'https://richards-lambda-test-qa.s3.eu-west-2.amazonaws.com',
      "Access-Control-Allow-Methods" => 'POST,GET,OPTIONS'
    }
  }
end
