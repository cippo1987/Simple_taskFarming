#The following 5 lines (the for cycle) create a file with the list of folders and files whose name are 3 chars. This passage can be created in other ways of course.
for n in ???
 do
 echo "$n" >> vet.dat
 done 
#mapfile reads the content of a file, vet.dat in this case, and trasfor each of his lines in a string entry of array "array"
mapfile -t array < vet.dat


#This is another example where a C-like cycle reads the entry of array and perform an operation (command in this case) in the folders in group of two. This could be useful to run prallel jobs in arbitrary number of steps.
for ((j=0; j<98;j=j+2))
do
	cd "${array[j]}"

        command &
	cd .. 

         cd "${array[j+1]}"
  	command &
        cd ..
wait
done
