Paperclip::Schema::COLUMNS.merge!(:url => :text)

Paperclip::Attachment.default_options[:storage] = :elvfs
Paperclip::Attachment.default_options[:path]    = ':attachment/:date/:id/:filename'
#Paperclip::Attachment.default_options[:url]     = :file_url

Paperclip.interpolates :date do |attachment, style|
  Date.today.strftime '%Y/%m/%d'
end
