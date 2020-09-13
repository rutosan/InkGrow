require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_directory  = 'inkgrow'
  config.fog_credentials = {
    provider: 'AWS',
      aws_access_key_id: ENV['AKIAJMWSAPVAFKV5VAMQ'],
      aws_secret_access_key: ENV['secreh6wud1IDgKRl7SHzuheeCJBLtW0bXSQgMW4Qwmst_access_key'],
      region: ENV['ap-northeast-1'],
      path_style: true
  }

  config.fog_directory  = 'inkgrow'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/inkgrow'
end