# encoding: utf-8
require 'rubygems'
require 'RMagick' unless defined?(Magick)
module ImageHelper
  class SmileyValidation
  	def initialize()
  		@smileychars = Regexp.compile("^\s*['%sÞ]*\s*$" % Regexp.escape('^#&)(*-,/.0398€;:=<>@CBDOPSTX[]\_cbdmoqpuwv}|~!"'))
  		@eye = "[%s]{1,2}|[0oO]" % Regexp.escape('^><=T')
  		@smileyjapanese = Regexp.compile("(%s)([_ \.w-]{0,3})(%s)" % [@eye,@eye])
		end
		def is_japanese_style(txt)
		  return @smileyjapanese.match(txt)
	  end
  	def is_valid(txt)
  		return @smileychars.match(txt)
    end
  end
  
  class SmileyImage
    include Magick
    def generate(smiley,rotate=true)
      granite = ImageList.new('plasma:fractal') {self.size = "128x128"}
      canvas = ImageList.new
      canvas.new_image(128, 128, TextureFill.new(granite))
      text = Draw.new{
        self.font = 'Helvetica'
        self.font_family = 'Lucida Grande'
        self.pointsize = 52
        self.gravity = CenterGravity; 
      }
      #p text.methods
      text.skewy(30).annotate(canvas, 0,0,2,2, smiley) {
        self.fill = 'gray83'
      }.annotate(canvas, 0,0,-1.5,-1.5, smiley) {
        self.fill = 'gray40'
      }.annotate(canvas, 0,0,0,0, smiley) {
        self.fill = 'black'
      }
      if rotate
        return canvas.rotate(90)
      else
        return canvas
      end
    end
  end
end
