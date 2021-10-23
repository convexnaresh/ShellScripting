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

echo
echo "INVERTED TRIANGLE -"
echo
for i in $(seq 10 -1 0)
do
    for j in $(seq $i  -1 0)
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


echo "Pyramid"
rows=6;
for i in $(seq 1 1 $rows)
do
    uplimit=$(($rows-$i))
    for j in $(seq 1 1 $uplimit)
    do
        echo -n -e "  "
    done
    
    for k in $(seq 1 1 $(($i*2-1)))
    do
        echo -n "* "
    done

    echo
done

echo
echo "FT"
n=1
r=5
for i in $(seq 1 1 $r)
do
    for j in $(seq 1 1 $(($i-1)))
    do
        echo -n "$n "
        n=$(($n+1))
        
    done
    echo
done

echo
echo "US-like FLAG"
A=13
B=24
C=7
D=9
star="*"
for i in $(seq 1 1 $A)
do
    if [[ $(($i%2)) == 1 ]]
    then
        color=" R "
    else
        color=" W "
    fi
    #print colors 
    for j in $(seq 1 1 $B)
    do 
        #print * between D and C
        if [[ $j -le $D && $i -le $C ]]
        then
            #odd row print 6 *s
            if [[ $(($i%2)) -eq 1 ]]
            then
                if [[ $j -le 6 ]];
                then                      
                  echo -n " $star "       
                else
                    echo -n "$color"
                    continue
                fi
            else
                #Even row print 5 *s
                if [[ $j -le 5 ]];
                then                      
                  echo -n "  $star"      

                elif [[ $j -eq 6 ]]
                then
                    echo -n "   "
                else 
                    echo -n "$color"
                    continue
                fi
            fi
        else
            echo -n "$color"
        fi
    done
    echo
done
