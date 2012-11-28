require 'open-uri'

module Paperclip
  module Storage
    module Elvfs
      def self.extended base
      end

      def exists?(style_name = default_style)
        if original_filename
          !!directory_json(path(style_name))['files'].select{|file| file['name'] == original_filename.gsub(/\+/, ' ')}.first
        else
          false
        end
      end

      def flush_writes #:nodoc:
        @queued_for_write.each do |style_name, file|
          curl = Curl::Easy.new(storage_url("#{File.dirname(path(:style_name))}?cmd=upload&target=#{directory_target(path(:style_name))}")) do |curl|
            curl.multipart_form_post = true
          end
          curl.http_post(Curl::PostField.file('upload[]', file.path, File.basename(path(:style_name))))
        end

        after_flush_writes # allows attachment to clean up temp files

        @queued_for_write = {}
      end

      def flush_deletes #:nodoc:
        # TODO: Please! Implement this method.
        @queued_for_write = {}
      end

      private
        def directory_json(path)
          JSON.parse(open(storage_url("#{File.dirname(path)}?cmd=open&init=true")).read)
        end

        def directory_target(path)
          directory_json(path)['cwd']['hash']
        end

        def storage_url(path='')
          "http://localhost:3005/api/el_finder/v2/#{path}"
        end
    end
  end
end
