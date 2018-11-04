require 'jekyll'
require 'fileutils'
require_relative 'miniaudio/version'

class MiniAudio < Liquid::Tag
  def initialize(tag_name, audio_url, options)
    super
    @audio_url = audio_url
  end

  def render(_context)
    ma_path = File.join File.expand_path(__dir__), 'miniaudio'
    template = File.read(File.join(ma_path, 'h5audio', 'template.html'))
    Liquid::Template.parse(template).render(
      'audioSrc' => @audio_url,
      'title' => File.basename(@audio_url, '.*'),
      'assets_path' => "/assets/miniaudio-#{Jekyll::Miniaudio::VERSION}",
      'id' => Random.rand.to_s
    )
  end
end

Jekyll::Hooks.register :site, :after_init do |site|
  destination_dir = site.config['destination']
  dest_assets_path = File.join destination_dir, 'assets', "miniaudio-#{Jekyll::Miniaudio::VERSION}"
  src_asset_path = File.join File.expand_path(__dir__), 'miniaudio', 'h5audio'
  unless Dir.exist?(dest_assets_path)
    FileUtils.cp_r(src_asset_path, dest_assets_path)
  end

  # make sure directory _sitesassets/miniaudio-*.*.* will be kept by jekyll
  keep_files = site.config['keep_files']
  asset_path = "assets/miniaudio-#{Jekyll::Miniaudio::VERSION}"
  keep_files.push(asset_path) unless keep_files.include?(asset_path)
end

Liquid::Template.register_tag('miniaudio', MiniAudio)
