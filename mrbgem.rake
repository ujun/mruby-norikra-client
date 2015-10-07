MRuby::Gem::Specification.new('mruby-norikra-client') do |spec|
  spec.license = 'MIT'
  spec.authors = 'Jun Uchino'
  spec.summary = 'Norikra library for mruby'

  spec.add_dependency 'mruby-msgpack', github: 'suzukaze/mruby-msgpack' 
  spec.add_dependency 'mruby-httprequest', github: 'matsumoto-r/mruby-httprequest' 
end
