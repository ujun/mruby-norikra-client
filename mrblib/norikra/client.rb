module Norikra
  class Client < HttpRequest

    REQUEST          = 0
    RESPONSE         = 1
    NOTIFICATION     = 2
    RPC_DEFAULT_PORT = 26571
    HEADER           = {'Content-Type' => 'application/x-msgpack'}

    def initialize(host='localhost', port=RPC_DEFAULT_PORT)
      @url = "http://#{host}:#{port}/"
      @seqid = 0
    end

    private
    def call(method, *args)
      send_request(method, args)
    end

    def send_request(method, args) 
      data = create_request_body(method, args)
      post(@url, data, HEADER)
    end

    def create_request_body(method, args)
      method = method.to_s
      msgid = @seqid
      @seqid += 1
      data = [REQUEST, msgid, method, args].to_msgpack
    end
 
    def targets
      MessagePack.unpack(call(:targets).body)
    end

    def open(target, fields=nil, auto_field=true)
      MessagePack.unpack(call(:open, target, fields, auto_field).body)
    end

    def close(target)
      MessagePack.unpack(call(:close, target).body)
    end

    def modify(target, auto_field)
      MessagePack.unpack(call(:modify, target, auto_field).body)
    end

    def queries
      MessagePack.unpack(call(:queries).body)
    end

    def register(query_name, query_group, query_expression)
      MessagePack.unpack(call(:register, query_name, query_group, query_expression).body)
    end

    def deregister(query_name)
      MessagePack.unpack(call(:deregister, query_name).body)
    end

    def suspend(query_name)
      MessagePack.unpack(call(:suspend, query_name).body)
    end

    def resume(query_name)
      MessagePack.unpack(call(:resume, query_name).body)
    end

    def fields(target)
      MessagePack.unpack(call(:fields, target).body)
    end

    def reserve(target, field, type)
      MessagePack.unpack(call(:reserve, target, field, type).body)
    end

    def send(target, events)
      MessagePack.unpack(call(:send, target, events).body)
    end

    def event(query_name)
      MessagePack.unpack(call(:event, query_name).body)
    end

    def see(query_name)
      MessagePack.unpack(call(:see, query_name).body)
    end

    def sweep(query_group=nil)
      MessagePack.unpack(call(:sweep, query_group).body)
    end

    def logs
      MessagePack.unpack(call(:logs).body)
    end
  end
end
