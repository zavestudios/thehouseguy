class Post < ApplicationRecord

  include PgSearch
	# validate :original_image_format

	has_one_attached :original_image
	has_one_attached :carousel_image
	has_one_attached :post_image
	# TODO can we change :thumbnail to :card_image? I'd like to keep things as semantic as possible
	has_one_attached :thumbnail

  pg_search_scope :search_posts,
                  against: [:title, :body],
                  using: {
                    tsearch: {
                      dictionary: 'english',
                      normalization: 0
                    }
                  }

  def self.text_search(query)
    if query.present?
      search_posts(query)
    else
      all
    end
  end

	def process_original_image(upload)
		self.original_image.attach(upload)
		if original_image_format
	    # pre-process original image for carousel - 900px in width
			original = MiniMagick::Image.open(self.original_image.service_url)
	    carousel_image = original
	    carousel_image.resize "900"
	    carousel_image.write("#{Rails.root}/tmp/temp_images/carousel_image.jpg")
	    # pre-process original image for the post's show page
	    post_image = original
	    post_image.resize "600"
	    post_image.write("#{Rails.root}/tmp/temp_images/post_image.jpg")
	    # now pre-process original image for card/thumbnail - 250px width
	    thumbnail = original
			post_image.resize "900"
	    thumbnail.crop "250x250+#{original.width()/2}+#{original.height/2}"
	    thumbnail.write("#{Rails.root}/tmp/temp_images/thumbnail.jpg") # card.jpg

	    self.carousel_image.attach(io: File.open("#{Rails.root}/tmp/temp_images/carousel_image.jpg"), filename: 'carousel_image.jpg')
	    self.post_image.attach(io: File.open("#{Rails.root}/tmp/temp_images/post_image.jpg"), filename: 'post_image.jpg')
	    self.thumbnail.attach(io: File.open("#{Rails.root}/tmp/temp_images/thumbnail.jpg"), filename: 'thumbnail.jpg')
	    # delete original image from aws storage
	    self.original_image.purge
			return true
		else
			return false
		end
	end

	private
		# TODO can we change this to valid_image_format?
		# Add pdf to content type array
		def original_image_format
			if original_image.attached? && original_image.content_type.in?(%w(image/jpeg image/png))
				return true
			else
				original_image.purge_later
				# TODO errors.add(:original_image, 'needs to be an image')
				return false
			end
		end
end
