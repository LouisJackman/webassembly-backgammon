;;;;
;;;; Module Functions
;;;;

;;;
;;; Drawing
;;;

(func $draw-border
  (call $canvas-set-fill-style (get_global $colour-red))
  (call $canvas-fill-rect
    (i32.const 10)
    (i32.const 10)
    (i32.const 40)
    (i32.const 40)
  )
)

(func $draw-points
)

(func $draw-scores
)

(func $draw
  (call $draw-border)
  (call $draw-points)
  (call $draw-scores)
)

;;;
;;; Input Processing
;;;

(func $process-input
)

;;;
;;; State Management
;;;

(func $initialise-state
  (i32.store8
    (get_global $should-quit-offset)
    (i32.const 1)
  )
)

(func $update-state
)