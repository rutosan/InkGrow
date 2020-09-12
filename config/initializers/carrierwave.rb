require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_directory  = 'inkgrow'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.credentials.aws[:AKIAJMWSAPVAFKV5VAMQ],
    aws_secret_access_key: Rails.application.credentials.aws[:h6wud1IDgKRl7SHzuheeCJBLtW0bXSQgMW4Qwms],

    region: ENV['ap-northeast-1'],
    path_style: true
  }

end