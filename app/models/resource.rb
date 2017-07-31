class Resource < ActiveRecord::Base
    mount_uploader :attachment, AttachmentUploader 
    validates :title, presence: true
    validates :attachment, presence:true
end
