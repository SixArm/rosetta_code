f = "%Y-%m-%dT%H:%M:%S.%NZ"
t = Time.now.utc
s = t.strftime(f)
puts s

