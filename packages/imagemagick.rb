package :imagemagick do
  description "ImageMagick"
  apt %w(imagemagick), sudo: true

  verify do
    has_executable "mogrify"
  end
end
