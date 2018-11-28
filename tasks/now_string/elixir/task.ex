# Typical:
#
#     IO.puts DateTime.utc_now() |> DateTime.to_iso8601()
#
f = "~4..0B-~2..0B-~2..0BT~2..0B:~2..0B:~2..0B.~6..0B000Z"
d = DateTime.utc_now() 
s = :io_lib.format(f, [d.year, d.month, d.day, d.hour, d.minute, d.second, elem(d.microsecond, 0)]) |>
IO.iodata_to_binary                                              
IO.puts s
