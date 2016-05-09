Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = '/images/:class/:attachment/:id_partition/:style-:filename'
Paperclip::Attachment.default_options[:s3_host_name] = 's3-eu-west-1.amazonaws.com'
Paperclip::Attachment.default_options[:s3_protocol] = :https

# Paperclip::Attachment.default_options.update({
#   :path => "/images/:class/:attachment/:hash/:style.:filename",
#   :hash_secret => ENV["S3_FILE_SECRET"]
# })
