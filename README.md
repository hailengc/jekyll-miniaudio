# Jekyll::Miniaudio

A minimal audio plugin for [Jekyll](https://jekyllrb.com/).

The implementation is based on [HTML5 audio element](https://www.w3schools.com/html/html5_audio.asp) (without fallback support for flash), so a morden browser is expected.

Audio formats support also depends on browsers, but generally mp3, wav, ogg are supported.

See [Live Demo](https://hailengc.github.io/jekyll-miniaudio)

## Installation

- In your Jekyll project's Gemfile:
  ```ruby
    group :jekyll_plugins do
        ...   # other plugins
        jekyll-miniaudio # add here
    end
  ```
  then `bundle install`.

## Usage

This plugin is a [Jekyll Tag](https://jekyllrb.com/docs/plugins/tags/), you just pass either an audio link or file path.

- Use with audio link:

  `{% miniaudio 'https://somewhere/themusic.mp3' %}`

- Use with file path. For example if you have a demo.map located in your assets/music folder, then just put:

  `{% miniaudio '/assets/music/demo.mp3' %}`

  **Ensure your file is accessible via http(s)://YOUR_HOST/assets/demo.mp3**

## Issues and feature requests

Feel free to create issues or send me email hailengc@gmail.com.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hailengc/jekyll-miniaudio.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
