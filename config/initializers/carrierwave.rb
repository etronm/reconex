CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => 'AKIAJ2YIE4L7T2K6AAEA',                        # required
      :aws_secret_access_key  => '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',                        # required
      :region                 => 'us-west-2',                  # optional, defaults to 'us-east-1'
      #:host                   => 's3.example.com',             # optional, defaults to nil
      #:endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'reconex-test'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end