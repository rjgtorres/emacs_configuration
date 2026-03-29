(use-package rdt-rand-elisp
  :ensure nil
  :no-require t
  :config
  (defun my-create-header (text)
    "Create a stylized header with TEXT centered in 80 characters."
    (interactive "sHeader text: ")
    (let* ((total-width 80)
           (text-length (length text))
           (padding-total (- total-width text-length 2)) ; 2 for spaces around text
           (padding-each-side (/ padding-total 2))
           (padding-left padding-each-side)
           (padding-right (- padding-total padding-left))
           (header-line (make-string total-width ?#))
           (text-line (concat 
                       (make-string padding-left ?#)
                       " " text " "
                       (make-string padding-right ?#))))
      
      (insert header-line "\n")
      (insert text-line "\n")
      (insert header-line "\n"))))

(provide 'rdt-rand-elisp)
