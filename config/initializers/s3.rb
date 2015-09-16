if Rails.env == "production"
  # set credentials from ENV hash
  S3_CREDENTIALS = { :access_key_id => ENV['AKIAJOTEXVV57JKGDPBA'], :secret_access_key => ENV['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'], :bucket => "extrara-images"}
else
  # get credentials from YML file
  S3_CREDENTIALS = Rails.root.join("config/s3.yml")
end