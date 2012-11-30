# add url field into migration
Paperclip::Schema::COLUMNS.merge!(:url => :text)

# default settings
Paperclip::Attachment.default_options[:path]      = ':app_name/:attachment/:date/:id/:filename'
Paperclip::Attachment.default_options[:url]       = :file_url

# our interpolators
Paperclip.interpolates :app_name do |attachment, style|
  Rails.application.railtie_name.sub /_application$/, ''
end

Paperclip.interpolates :date do |attachment, style|
  Date.today.strftime '%Y/%m/%d'
end
