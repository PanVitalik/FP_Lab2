(defun decompress-list (lst)
  (cond
    ;; У випадку якщо наший лист порожный ми повертаэмо nil
    ((null lst) nil)
    ;; Розпаковуємо першу пару, після чого за допомогою make-list створюэмо новий список
    (t
     (let ((n (car (car lst)))      ; n -  кількість повторень
           (symvol (cadr (car lst)))) ; symvol - наший елемент
       (append (make-list n :initial-element symvol)
               (decompress-list (cdr lst)))))
  )
  
)
;;Тест, який порівнює результат, що повертає програма із правильною відповіддю
(defun test_program_bool()
  (format t "~%Test 1(b): ~A~%" (equal (decompress-list '((3 2) (1 q) (2 t) (1 7))) '(2 2 2 q t t 7)))
  (format t "Test 2(b): ~A~%" (equal (decompress-list '((0 t) (3 w) (1 y))) '(w w w y)))
  (format t "Test 3(b): ~A~%" (equal (decompress-list '((0 e))) nil))
  (format t "Test 4(b): ~A~%" (equal (decompress-list '((1 1))) '(1)))
  (format t "Test 5(b): ~A~%" (equal (decompress-list  nil) nil))
)
;;Тест, який виводить на екран результат виконання програми
(defun test_program()
  (format t "~%Test 1: ~A~%" (decompress-list '((3 2) (1 q) (2 t) (1 7))))
  (format t "Test 2: ~A~%" (decompress-list '((0 t) (3 w) (1 y))))
  (format t "Test 3: ~A~%" (decompress-list '((0 e))))
  (format t "Test 4: ~A~%" (decompress-list '((1 1))))
  (format t "Test 5: ~A~%" (decompress-list nil))
  
)

;;(test_program_bool)
(test_program)
