require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'


unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIARK72X3VLOXYP5S7Z',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'inkgrow'
    config.cache_storage = :fog
  end
end