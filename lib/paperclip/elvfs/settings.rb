Paperclip::Schema::COLUMNS.merge!(:url => :text)

Paperclip::Attachment.default_options[:storage] = :elvfs
Paperclip::Attachment.default_options[:path]    = ':attachment/:date/:id/:filename'
Paperclip::Attachment.default_options[:url]     = ':attachment_url'

Paperclip.interpolates :attachment_url do |attachment, style|
  attachment.instance.file_url
end

Paperclip.interpolates :date do |attachment, style|
  Date.today.strftime '%Y/%m/%d'
end
