;;;
;;; Start
;;;

(func $start
  (call $canvas-set-fill-style (get_global $colour-red))
  (call $canvas-fill-rect
    (i32.const 10)
    (i32.const 10)
    (i32.const 40)
    (i32.const 40)
  )
)

(start $start)
