class ImageUploader < Shrine
  Attacher.validate do
    validate_mime_type %w[jpeg png webp]
  end
end
