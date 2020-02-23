CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1',
    path_style: true
  }
  
  config.fog_directory = 'greatconnect'
  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/greatconnect'
  
end