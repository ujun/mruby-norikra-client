# mruby-norikra-client   [![Build Status](https://travis-ci.org/ujun/mruby-norikra-client.png?branch=master)](https://travis-ci.org/ujun/mruby-norikra-client)
Norikra class
## install by mrbgems
- add conf.gem line to `build_config.rb`

```ruby
MRuby::Build.new do |conf|

    # ... (snip) ...

    conf.gem :github => 'ujun/mruby-norikra-client'
end
```
## example
```ruby
p Norikra.hi
#=> "hi!!"
t = Norikra.new "hello"
p t.hello
#=> "hello"
p t.bye
#=> "hello bye"
```

## License
under the MIT License:
- see LICENSE file
