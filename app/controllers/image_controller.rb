require 'rubygems'
require 'RMagick'
class ImageController < ApplicationController
  def view
    smiley = params[:smiley] 
    validation = ImageHelper::SmileysValidation.new()
    if (!validation.is_valid(smiley))
      smiley = ':P'
    end
    
    granite = Magick::ImageList.new('plasma:fractal') {self.size = "128x128"}
    canvas = Magick::ImageList.new
    canvas.new_image(128, 128, Magick::TextureFill.new(granite))
    text = Magick::Draw.new{
      self.font_family = 'Lucida Grande'
      self.pointsize = 52
      self.gravity = Magick::CenterGravity; 
    }
    #p text.methods
    text.skewy(30).annotate(canvas, 0,0,2,2, smiley) {
      self.fill = 'gray83'
    }.annotate(canvas, 0,0,-1.5,-1.5, smiley) {
      self.fill = 'gray40'
    }.annotate(canvas, 0,0,0,0, smiley) {
      self.fill = 'black'
    }
    
    send_data(canvas.rotate(90).to_blob{self.format="jpg"}, :disposition => 'inline', 
   	                          :type => 'image/jpg')
    
  end

end
