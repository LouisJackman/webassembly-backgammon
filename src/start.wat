;;;
;;; Start
;;;

(func $start
  (local $should-quit i32)

  (call $initialise-state)

  (loop $main-loop
    (call $draw)
    (call $process-input)
    (call $update-state)

    (set_local
      $should-quit
      (i32.load8_u (get_global $should-quit-offset))
    )
    (br_if $main-loop (i32.eqz (get_local $should-quit)))
  )
)

(start $start)
