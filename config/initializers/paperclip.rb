# Paperclip.options[:content_type_mappings] = {
#   :jpeg => "text/plain", :jpg => "text/plain" 
# }

#https://stackoverflow.com/questions/23629888/validation-failed-upload-file-has-an-extension-that-does-not-match-its-contents
module Paperclip
  class MediaTypeSpoofDetector
    def spoofed?
      false
    end
  end
end
