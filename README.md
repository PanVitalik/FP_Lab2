## МОНУ НТУУ КПІ ім. Ігоря Сікорського ФПМ СПіСКС

### Звіт з лабораторної роботи 2
 "Рекурсія"
 дисципліни "Вступ до функціонального програмування"

**Студент**: *Лисенко Віталій КВ-22*


**Рік**: *2025*

## Завдання за варіантом №13:
Реалізуйте дві рекурсивні функції, що виконують деякі дії з вхідним(и) списком(-ами), за
можливості/необхідності використовуючи різні види рекурсії. Функції, які необхідно
реалізувати, задаються варіантом (п. 2.1.1). Вимоги до функцій:
1. Зміна списку згідно із завданням має відбуватись за рахунок конструювання нового
списку, а не зміни наявного (вхідного).
2. Не допускається використання функцій вищого порядку чи стандартних функцій
для роботи зі списками, що не наведені в четвертому розділі навчального
посібника.
3. Реалізована функція не має бути функцією вищого порядку, тобто приймати функції
в якості аргументів.
4. Не допускається використання псевдофункцій (деструктивного підходу).
5. Не допускається використання циклів.
Кожна реалізована функція має бути протестована для різних тестових наборів. Тести
мають бути оформленні у вигляді модульних тестів (див. п. 2.3).

![Варіант 13](https://github.com/PanVitalik/FP_Lab2/blob/main/%D0%97%D0%BD%D1%96%D0%BC%D0%BE%D0%BA%20%D0%B5%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202025-12-08%20000228.png)

**Код для першої частини:**
```
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
```
**Результат:**
```
Output:

Test 1: (A G H X V I)
Test 2: (1 2 3 7 8 9)
Test 3: (O T G)
Test 4: NIL
Test 5: (Q W E U)
```

**Код для другої частини:**
```
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
```
**Результат:**
```
Output:

Test 1: (2 2 2 Q T T 7)
Test 2: (W W W Y)
Test 3: NIL
Test 4: (1)
Test 5: NIL
```

