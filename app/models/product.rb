class Product < ApplicationRecord
    enum status: [:active, :inactive]
    has_many :product_quantities, :dependent => :destroy

    mount_uploader :photo, PhotoUploader
end