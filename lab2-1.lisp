(defun remove-even-triples (lst)
  (cond
    ;; Якщо список пустий то повертаємо nil
    ((null lst) nil)
    ;; Якщо список містить < 3 елементів то повертаємо його
    ((< (length lst) 3) lst)
    ;; Залишити першу трійку, пропустити другу, продовжити з рештою
    (t
     (append (subseq lst 0 3) ; Залишаємо перші три елементи
             (remove-even-triples (nthcdr 6 lst)))) ; Пропускаємо 3 елементи які ми лишаємо + 3 елементи які ми видаляємо 
  )
)
;;Тест, який порівнює результат, що повертає програма із правильною відповіддю
(defun test_program_bool()
  (format t "Test 1(b): ~A~%" (equal (remove-even-triples '(a g h d u f x v i)) '(a g h x v i)))
  (format t "Test 2(b): ~A~%" (equal (remove-even-triples '(1 2 3 4 5 6 7 8 9 10 11 12)) '(1 2 3 7 8 9)))
  (format t "Test 3(b): ~A~%" (equal (remove-even-triples '(o t g)) '(o t g)))
  (format t "Test 4(b): ~A~%" (equal (remove-even-triples nil) nil))
  (format t "Test 5(b): ~A~%" (equal (remove-even-triples '(q w e r t y u)) '(q w e u)))
  )

;;Тест, якийвиводить на екран результат виконання програми
(defun test_program()
   (format t "~%Test 1: ~A~%" (remove-even-triples '(a g h d u f x v i)))
   (format t "Test 2: ~A~%" (remove-even-triples '(1 2 3 4 5 6 7 8 9 10 11 12)))
   (format t "Test 3: ~A~%" (remove-even-triples '(o t g)))
   (format t "Test 4: ~A~%" (remove-even-triples nil))
   (format t "Test 5: ~A~%" (remove-even-triples '(q w e r t y u)))
)

;;(test_program_bool)
(test_program)
