class ImageController < ApplicationController
  def initialize()
    @smileyValidation = ImageHelper::SmileyValidation.new()
    @smileyImage = ImageHelper::SmileyImage.new()
  end
  def view
    smiley = params[:smiley] 

    if (!@smileyValidation.is_valid(smiley))
      smiley = ':P'
    end
    
    smileyimage = @smileyImage.generate(smiley, ! @smileyValidation.is_japanese_style(smiley))
    send_data(smileyimage.to_blob{self.format="jpg"}, :disposition => 'inline', 
   	                          :type => 'image/jpg')
    
  end

end
