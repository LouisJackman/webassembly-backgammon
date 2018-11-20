(func $log (import "console" "log") (param $x i32))

(func $add (param $x i32) (param $y i32)
  (local $z i32)
  (set_local $z (i32.add
    (get_local $x)
    (get_local $y)
  ))

  (call $log (get_local $z))
)

(func $start
  (call $add (i32.const 2) (i32.const 3))
)

(start $start)
