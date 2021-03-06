;;;;
;;;; Module Globals
;;;;

;;;
;;; Constants
;;;

(global $point-count i32 (i32.const 24))

;; $point-count / 2
(global $point-per-side-count i32 (i32.const 12))

(global $checker-count i32 (i32.const 30))

;; $checker-count / 2
(global $each-player-checker-count i32 (i32.const 15))

;;;
;;; Enumerations
;;;

(global $empty i32 (i32.const 0))

(global $occupied-by-white i32 (i32.const 1))
(global $occupied-by-black i32 (i32.const 2))

(global $current-player-is-white i32 (i32.const 1))
(global $current-player-is-black i32 (i32.const 2))

;;;
;;; Memory Offsets
;;;

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

;; $current-dice-2-roll-offset + 1
(global $should-quit-offset i32 (i32.const 725))

;;;
;;; Canvas
;;;

(global $canvas-border-width-percent f32 (f32.const 0.025))
(global $canvas-point-width-percent f32 (f32.const 0.020))
(global $canvas-point-height-percent f32 (f32.const 0.45))
