;;;;
;;;; Module Functions
;;;;

;;;
;;; Canvas
;;;

(func $draw-border
  (local $canvas-width i32)
  (local $canvas-height i32)
  (local $border-width i32)

  (set_local $canvas-width (get_global $canvas-width))
  (set_local $canvas-height (get_global $canvas-height))

  (set_local $border-width (i32.trunc_u/f32 (f32.mul
    (f32.convert_u/i32 (get_local $canvas-width))
    (get_global $canvas-border-width-percent)
  )))

  (call $canvas-set-fill-style (get_global $colour-beige))

  (call $canvas-fill-rect
    (i32.const 0)
    (i32.const 0)
    (get_local $canvas-width)
    (get_local $border-width)
  )
  (call $canvas-fill-rect
    (i32.const 0)
    (i32.sub
      (get_local $canvas-height)
      (get_local $border-width)
    )
    (get_local $canvas-width)
    (get_local $border-width)
  )
  (call $canvas-fill-rect
    (i32.const 0)
    (get_local $border-width)
    (get_local $border-width)
    (i32.sub
      (get_local $canvas-height)
      (i32.mul (get_local $border-width) (i32.const 2))
    )
  )
  (call $canvas-fill-rect
    (i32.sub
      (get_local $canvas-width)
      (get_local $border-width)
    )
    (get_local $border-width)
    (get_local $border-width)
    (i32.sub
      (get_local $canvas-height)
      (i32.mul (get_local $border-width) (i32.const 2))
    )
  )
)

(func $draw-points-side (param $point-y-position i32)
  (local $point-per-side-count i32)
  (local $canvas-width i32)
  (local $canvas-height i32)
  (local $point-width-percent f32)
  (local $border-width-percent f32)
  (local $point-width i32)
  (local $border-width i32)
  (local $double-border-width i32)
  (local $segment-size i32)
  (local $half-segment-size i32)
  (local $half-point-width-percent f32)
  (local $point-height i32)
  (local $canvas-border-height i32)

  (local $i i32)
  (local $current-segment i32)

  (set_local $point-per-side-count (get_global $point-per-side-count))

  (set_local $canvas-width (get_global $canvas-width))
  (set_local $canvas-height (get_global $canvas-height))

  (set_local $point-width-percent (get_global $canvas-point-width-percent))

  (set_local $point-width (i32.trunc_u/f32 (f32.mul
    (f32.convert_u/i32 (get_local $canvas-width))
    (get_local $point-width-percent)
  )))

  (set_local $border-width-percent (get_global $canvas-border-width-percent))

  (set_local $border-width (i32.trunc_u/f32 (f32.mul
    (f32.convert_u/i32 (get_local $canvas-width))
    (get_local $border-width-percent)
  )))

  (set_local $double-border-width (i32.mul
    (get_local $border-width)
    (i32.const 2)
  ))

  (set_local $segment-size (i32.trunc_u/f32 (f32.div
    (f32.convert_u/i32 (i32.sub
        (get_local $canvas-width)
        (get_local $double-border-width)
    ))
    (f32.convert_u/i32 (get_local $point-per-side-count))
  )))

  (set_local $half-segment-size (i32.trunc_u/f32 (f32.div
    (f32.convert_u/i32 (get_local $segment-size))
    (f32.const 2)
  )))

  (set_local $half-point-width-percent (f32.div
    (get_local $point-width-percent)
    (f32.const 2)
  ))

  (set_local $point-height (i32.sub
    (i32.trunc_u/f32 (f32.mul
      (f32.convert_u/i32 (get_local $canvas-height))
      (get_global $canvas-point-height-percent)
    ))
    (get_local $double-border-width)
  ))

  (call $canvas-set-fill-style (get_global $colour-red))

  (loop
    (set_local $i (i32.add
        (get_local $i)
        (i32.const 1)
    ))

    (set_local $current-segment (i32.add
      (i32.sub
        (i32.mul
            (get_local $segment-size)
            (get_local $i)
        )
        (get_local $half-segment-size)
      )
      (i32.trunc_u/f32 (f32.mul
        (f32.convert_u/i32 (get_local $canvas-width))
        (get_local $border-width-percent)
      ))
    ))

    (call
      $canvas-fill-rect
      (i32.sub
        (get_local $current-segment)
        (i32.trunc_u/f32 (f32.mul
          (f32.convert_u/i32 (get_local $canvas-width))
          (get_local $half-point-width-percent)
        ))
      )
      (get_local $point-y-position)
      (get_local $point-width)
      (get_local $point-height)
    )

    (br_if 0 (i32.lt_u
      (get_local $i)
      (get_global $point-per-side-count)
    ))
  )
)

(func $draw-top-points
  (local $border-width i32)


  (set_local $border-width (i32.trunc_u/f32 (f32.mul
    (f32.convert_u/i32 (get_global $canvas-width))
    (get_global $canvas-border-width-percent)
  )))


  (call $draw-points-side (get_local $border-width))
)

(func $draw-bottom-points
  (local $canvas-height i32)
  (local $canvas-width i32)
  (local $border-width-percent f32)
  (local $border-width i32)
  (local $point-height i32)
  (local $double-border-width i32)
  (local $position i32)

  (set_local $canvas-height (get_global $canvas-height))
  (set_local $canvas-width (get_global $canvas-width))

  (set_local $border-width-percent (get_global $canvas-border-width-percent))

  (set_local $border-width (i32.trunc_u/f32 (f32.mul
    (f32.convert_u/i32 (get_local $canvas-width))
    (get_local $border-width-percent)
  )))

  (set_local $double-border-width (i32.mul
    (get_local $border-width)
    (i32.const 2)
  ))

  (set_local $point-height (i32.sub
    (i32.trunc_u/f32 (f32.mul
      (f32.convert_u/i32 (get_local $canvas-height))
      (get_global $canvas-point-height-percent)
    ))
    (get_local $double-border-width)
  ))

  (set_local $border-width-percent (get_global $canvas-border-width-percent))

  (set_local $position (i32.sub
    (get_global $canvas-height)
    (i32.add
        (get_local $point-height)
        (get_local $border-width)
    )
  ))

  (call $draw-points-side (get_local $position))
)

(func $draw-points
  (call $draw-top-points)
  (call $draw-bottom-points)
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
