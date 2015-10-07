# mruby-norikra-client   [![Build Status](https://travis-ci.org/ujun/mruby-norikra-client.png?branch=master)](https://travis-ci.org/ujun/mruby-norikra-client)
Norikra::Client class

This is the Norikra client library implementation for mruby(a port from [the library for CRuby](https://github.com/norikra/norikra-client-ruby)), and has the same API as it.
Therefore, for more information, please see the original page.

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
client = Norikra::Client.new("localhost", 26571)
client.open('sample01', {id:'integer', name:'string', age:'integer', email:'string'})
client.register('q1', nil, 'select id, name from sample01')
client.send('sample01', [:id => num, :name => "name", :age => 30, :email => "name@local.host"])
client.event('q1')
```

## License
under the MIT License:
- see LICENSE file
