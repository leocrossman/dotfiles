function Gf()
    try
        exec "normal! gf"
    catch /E447/
        edit <cfile>
    endtry
endfunction

noremap gf :call Gf()<CR>
