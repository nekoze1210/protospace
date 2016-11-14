module FormHelper
  def set_prototype(prototype)
    if prototype.new_record?
      prototype.protoimages.new(role: :main)
    end

    image_space_count = 2
    posting_image_count = prototype.protoimages.sub.size
    if posting_image_count < image_space_count
      (image_space_count - posting_image_count).times do
        prototype.protoimages.new(role: :sub)
      end
    end
    prototype
  end
end