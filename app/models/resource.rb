class Resource < ActiveRecord::Base
    # mount_uploader :attachment, AttachmentUploader 
    validates :title, presence: true
    validates :attachment, presence: true
    
    def initialize(incoming_file = {})
      super
      if incoming_file["attachment"] && incoming_file["title"]
        self.title = incoming_file["title"]
        self.file_type = incoming_file["attachment"].content_type
        self.attachment = sanitize_filename(incoming_file["attachment"].original_filename)
        self.file_contents = incoming_file["attachment"].read
      end
    end
    
    def sanitize_filename(filename)
        just_filename = File.basename(filename)
        just_filename.gsub(/[^\w\.\-]/, '_')
    end
    
end
