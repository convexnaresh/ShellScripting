#Learning loops while drawing shapes

echo "SQUARE"
for i in $(seq 0 1 10)
do
    for j in $(seq 0  1 10)
    do
        echo -e -n "$j "
    done
    echo  
    
done

echo
echo "TRIANGLE"
for i in $(seq 0 1 10)
do
    for j in $(seq 0  1 $i)
    do
        echo -e -n "$j "
    done
    echo  
done

echo
echo "TRIANGLE-"
echo
for i in $(seq 0 1 10)
do
    for j in $(seq 0  1 $i)
    do
        echo -e -n "$j "
    done
    echo  
    
    a=""
    for k in $(seq 0 1 $i)
    do
        a+="-"
        let i++;
    done
    echo $a

done

#Write a script to print a pyramid.
#Write a script to print a US-like map using sequence of *, W and R. 
Sequence of W for white strips; Sequence of R fro red strips.
