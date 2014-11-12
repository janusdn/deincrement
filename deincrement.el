;; Common subroutines used for increment and decrement.
(defun bound-of-integer (str bounds)
  (let* ((left-bound (string-match "[-+]?[0-9]+" str))
         (right-bound (match-end 0)))
  (list (+ (car bounds) left-bound) (+ (car bounds) right-bound) left-bound right-bound)))

(defun test-bound-of-integer ()
  (let* ((testResults  (let ((testData '(("200" 0 3) ("200dsdfs" 0 3) ("abc200dsdfs" 3 6) ("abc200" 3 6) ("abc-200dsdfs" 3 7) ("abc+200dsdfs" 3 7))))
                        (mapcar (lambda (test)
                                  (let* ((testStr (car test))
                                         (expected-left-bound (cadr test))
                                         (expected-right-bound (caddr test))
                                         (left-bound (car (bound-of-integer testStr '(0 0))))
                                         (right-bound (cadr (bound-of-integer testStr '(0 0))))
                                         )
                                    (progn
                                      (message testStr)
                                      (message (number-to-string expected-left-bound))
                                      (message (number-to-string expected-right-bound))
                                      (message (number-to-string left-bound))
                                      (message (number-to-string right-bound))
                                      (message "%s" (equal (equal expected-left-bound left-bound) (equal expected-right-bound right-bound)))
                                      (equal (equal expected-left-bound left-bound) (equal expected-right-bound right-bound))
                                      )
                                    )
                                  )
                                testData)
                        )
                      )
         (result (reduce 'equal testResults))
        )
    (if result
        (message "Test passed")
        (message "Tests failed: %s" result)
        )
    )
  )
;; (test-bound-of-integer)    


(defun deincrement (op)
(let* ((str (thing-at-point 'symbol))
       (string-bounds (bound-of-integer str (bounds-of-thing-at-point 'symbol)))
       (left-bound (caddr string-bounds))
       (right-bound (cadddr string-bounds))
       (n (string-to-number (substring str left-bound right-bound)))
        (org_point (point)))
          (unless (null string-bounds)
            (progn
              (kill-region (car string-bounds)
                           (cadr string-bounds)) 
              (insert (number-to-string (funcall op n)))
              (goto-char org_point)))))

;; increment integer at point with 1.
(defun increment ()
(interactive)
(deincrement (lambda (x) (1+ x))))

(define-key global-map [M-up] 'increment)

;; decrement integer at point with 1.
(defun decrement ()
(interactive)
(deincrement (lambda (x) (1- x))))

(define-key global-map [M-down] 'decrement)
