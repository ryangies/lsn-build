augroup filetypedetect
au BufNewFile,BufRead *.css     setf hub+css
au BufNewFile,BufRead *.vm      setf velocity
au BufNewFile,BufRead *.ht      setf hub+html
au BufNewFile,BufRead *.ht      setf hf
au BufNewFile,BufRead *.tf      setf hub+html
au BufNewFile,BufRead *.html    setf hub+html
au BufNewFile,BufRead *.html.t  setf hub+html
au BufNewFile,BufRead *.txt     setf hubparse
au BufNewFile,BufRead *.js      setf hub+javascript
au BufNewFile,BufRead *.jmx     setf xml
au BufNewFile,BufRead *.dlg     setf hub+html
au BufNewFile,BufRead *.t       setf hubparse
augroup END
