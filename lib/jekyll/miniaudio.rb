require "jekyll"
require 'fileutils'

class MiniAudio < Liquid::Tag
  def initialize(tag_name, audio_url, options)
     super
     @audio_url = audio_url
    #  p tag_name
    #  p audio_url
    #  p options
  end

  def render(context)
    # Liquid::Context
    # p context.class
    dest_asset_path = File.join Dir.pwd, "assets", "miniaudio"
    puts dest_asset_path
    if !Dir.exist?(dest_asset_path)
      # copy assets
      puts "starting copy assets..."
      puts __FILE__
      src_asset_path = File.join File.dirname(File.absolute_path(__FILE__)), "miniaudio", "h5audio"
      puts src_asset_path
      FileUtils.cp_r(src_asset_path, dest_asset_path)
    end
  end 
end

Liquid::Template.register_tag('miniaudio', MiniAudio)