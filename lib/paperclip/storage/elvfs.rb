require 'open-uri'

module Paperclip
  module Storage
    module Elvfs
      def self.extended base
      end

      def exists?(style_name = default_style)
        if original_filename
          !!file_json(path(style_name))
        else
          false
        end
      end

      def flush_writes #:nodoc:
        @queued_for_write.each do |style_name, file|
          curl = Curl::Easy.new(storage_url("#{File.dirname(path(:style_name))}?cmd=upload&target=#{directory_target(path(:style_name))}")) do |curl|
            curl.multipart_form_post = true
            curl.on_success{|response| JSON.parse(response.body_str)['added'].first['url'] }
          end
          curl.http_post(Curl::PostField.file('upload[]', file.path, File.basename(path(:style_name))))
        end

        after_flush_writes # allows attachment to clean up temp files

        @queued_for_write = {}
      end

      def flush_deletes #:nodoc:
        @queued_for_delete.each do |path|
          log("deleting #{path}")
          delete_file(path)
        end
        @queued_for_delete = []
      end

      private
        def directory_json(path)
          JSON.parse(open(storage_url("#{File.dirname(path)}?cmd=open&init=true")).read)
        end

        def file_json(path)
          directory_json(path)['files'].select{|file| file['name'] == File.basename(path).gsub(/\+/, ' ')}.first
        end


        def directory_target(path)
          directory_json(path)['cwd']['hash']
        end

        def delete_file(path)
          if file_hash = file_json(File.dirname(path))
            open(storage_url("#{File.dirname(File.dirname(path))}?cmd=rm&targets[]=#{file_hash['hash']}"))
          end
        end

        def storage_url(path='')
          "http://localhost:3005/api/el_finder/v2/#{path}"
        end
    end
  end
end
