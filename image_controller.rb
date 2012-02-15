# encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'Image_helper'
get '/image/view' do
  @smileyValidation = ImageHelper::SmileyValidation.new()
  @smileyImage = ImageHelper::SmileyImage.new()
  smiley = params[:smiley] 

    if (!@smileyValidation.is_valid(smiley))
      smiley = ':P'
    end
    content_type "image/jpeg"
    
    smileyimage = @smileyImage.generate(smiley, ! @smileyValidation.is_japanese_style(smiley))
    smileyimage.to_blob{self.format="jpg"}
end