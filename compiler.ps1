$dir = (get-location).path
$fortran_files = Get-ChildItem $dir\*.f90 -Recurse | foreach { "$_" }
gfortran -o bin/main $fortran_files 
bin/./main.exe