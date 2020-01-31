unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: 'AKIARTWA4F75UMHEI5WJ',
        aws_secret_access_key: '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',
        region: 'ap-northeast-1'
    }
    
    config.fog_directory = 'greatconnect'
    config.cache_storage = :fog
  end
end