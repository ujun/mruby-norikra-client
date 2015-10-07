# mruby-norikra-client

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

# create new target on norikra server, to put events and queries
client.open('sample01', {id:'integer', name:'string', age:'integer', email:'string'})

# add query to norikra server
client.register('q1', nil, 'select id, name from sample01')

# send list of input events into norikra server
client.send('sample01', [:id => num, :name => "name", :age => 30, :email => "name@local.host"])

# fetch events of specified query's output
client.event('q1')
```

## License
under the MIT License:
- see LICENSE file
