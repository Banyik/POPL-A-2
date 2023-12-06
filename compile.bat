gfortran -c src/Main/Classes/person.f90 -o obj/person.o -J obj -I obj
gfortran -c src/Main/main.f90 -o obj/main.o -J obj -I obj

gfortran -o bin/main.exe obj/main.o obj/person.o