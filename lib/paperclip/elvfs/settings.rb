# add url field into migration
Paperclip::Schema::COLUMNS.merge!(:url => :text)

# default settings
Paperclip::Attachment.default_options[:path]       = ':app_name/:class/:attachment/:date/:id/:filename'
Paperclip::Attachment.default_options[:url]        = :file_url
Paperclip::Attachment.default_options[:escape_url] = false

# TODO: remove this warn when paperclip 3.3.2 will be released
class Paperclip::Attachment
  def url_with_unescape(style_name = default_style, options = {})
    ActiveSupport::Deprecation.warn "Remove this warning when paperclip 3.3.2 will be released"
    options[:escape] = false
    url_without_unescape(style_name, options)
  end

  alias_method_chain :url, :unescape
end

# our interpolators
Paperclip.interpolates :app_name do |attachment, style|
  Rails.application.railtie_name.sub /_application$/, ''
end

Paperclip.interpolates :date do |attachment, style|
  Date.today.strftime '%Y/%m/%d'
end
