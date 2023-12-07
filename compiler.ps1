$dir = (get-location).path
$fortran_files = Get-ChildItem $dir\*.f90 -Recurse | foreach { "$_" }
gfortran -o bin/main $fortran_files 
del *.mod
bin/./main.exe