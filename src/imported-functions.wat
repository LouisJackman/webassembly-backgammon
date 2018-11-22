;;;;
;;;; Imported Functions
;;;;

(func $console-log (import "console" "log") (param $x i32))

(func $canvas-set-fill-style (import "canvas" "setFillStyle") (param i32))
(func $canvas-set-stroke-style (import "canvas" "setStrokeStyle") (param i32))

(func
  $canvas-fill-rect
  (import "canvas" "fillRect")
  (param i32)
  (param i32)
  (param i32)
  (param i32)
)

