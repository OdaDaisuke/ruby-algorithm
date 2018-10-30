# coding: UTF-8

require 'rmagick'

fileName = "./sample.jpg"
image = Magick::ImageList.new(fileName)
image.write("sample_out.jpg")

class ImageOptimizer
  @@out_quality = 50

    def run_gc
      GC.start
    end

    def process(imageSrc)
      if /\.jpg$|\.jpeg$/i =~ imageSrc then
	out = File.basename(imageSrc).gsub(/.[^.]+$/,"_rsz.jpg")
	image = Magick::Image.read(imageSrc).first
	image.resize_to_fit(4898,4898)
	  .write(out){ self.quality = @@out_quality }
      end

      self.run_gc
    end

end

imageOptimizer = ImageOptimizer.new()
imageOptimizer.process(fileName)
