;;;;
;;;; WebAssembly Backgammon
;;;;

;;;
;;; Imported Globals
;;;

(import "colours" "red" (global $colour-red i32))
(import "colours" "black" (global $colour-black i32))
(import "colours" "white" (global $colour-white i32))
(import "colours" "beige" (global $colour-beige i32))

;;;
;;; Imported Functions
;;;

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

;;;
;;; Module Globals
;;;

(global $empty i32 (i32.const 0))

(global $point-count i32 (i32.const 24))
(global $checker-count i32 (i32.const 30))

;; $checker-count / 2
(global $each-player-checker-count i32 (i32.const 15))

(global $occupied-by-white i32 (i32.const 1))
(global $occupied-by-black i32 (i32.const 2))

(global $current-player-is-white i32 (i32.const 1))
(global $current-player-is-black i32 (i32.const 2))
(global $current-player-offset i32 (i32.const 0))

(global $points-offset i32 (i32.const 1))

;; $points-offset + ($checker-count * $point-count)
(global $remaining-white-pieces-count-offset i32 (i32.const 721))

;; $remaining-white-pieces-count-offset + 1
(global $remaining-black-pieces-count-offset i32 (i32.const 722))

;; $remaining-black-pieces-count-offset + 1
(global $current-dice-1-roll-offset i32 (i32.const 723))

;; $current-dice-1-roll-offset + 1
(global $current-dice-2-roll-offset i32 (i32.const 724))

;;;
;;; Module Memories
;;;

(memory 1)

;;;
;;; Module Functions
;;;



;;;
;;; Entry Point
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
