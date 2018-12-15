;;;;
;;;; State Management
;;;;

(func $initialise-state
  (i32.store8
    (get_global $should-quit-offset)
    (i32.const 1)
  )
)

(func $update-state
)

