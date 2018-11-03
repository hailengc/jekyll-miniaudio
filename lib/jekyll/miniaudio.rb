require 'jekyll'
require 'fileutils'
require_relative 'miniaudio/version'

class MiniAudio < Liquid::Tag
  def initialize(tag_name, audio_url, options)
    super
    @audio_url = audio_url
  end

  def render(_context)
    working_assets_path = File.join Dir.pwd, 'assets', "miniaudio-#{Jekyll::Miniaudio::VERSION}"
    ma_path = File.join File.expand_path(__dir__), 'miniaudio'
    unless Dir.exist?(working_assets_path)
      src_asset_path = File.join ma_path, 'h5audio'
      FileUtils.cp_r(src_asset_path, working_assets_path)
    end

    template = File.read(File.join(ma_path, 'h5audio', 'template.html'))
    Liquid::Template.parse(template).render(
      'audioSrc' => @audio_url,
      'title' => File.basename(@audio_url, ".*"),
      'assets_path' => "/assets/miniaudio-#{Jekyll::Miniaudio::VERSION}",
      'id' => Random.rand.to_s
      )
  end
end

Liquid::Template.register_tag('miniaudio', MiniAudio)
