##
## Norikra::Client Test
##

assert("Norikra#hello") do
  t = Norikra.new "hello"
  assert_equal("hello", t.hello)
end

assert("Norikra#bye") do
  t = Norikra.new "hello"
  assert_equal("hello bye", t.bye)
end

assert("Norikra.hi") do
  assert_equal("hi!!", Norikra.hi)
end
