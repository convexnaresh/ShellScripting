#Disclaimer

#This program is just for students learning and demo purpose. It should not be used for other purposes besides learning.
#Appropriate credit goes to different resources in the public domain.



#Print a string to console
echo “Hello, World!”
#remove a directory
rm -r ~/cpsc207/test_dir
mkdir ~/cpsc207/test_dir
touch ~/cpsc207/test_dir/mytestfile.txt
ls -l ~/cpsc207/test_dir

#Declaring and Initializing shell variables
bookname=”your-book”
number=12
price=100
echo “$bookname, $number, $price”


#===================================
#Reading user's input in a shell program
echo “Enter date of purchase: ”
read varpd
echo “Purchase date:$varpd”
echo -p “Enter edition and publisher’s name: ” vared

#===================================
#Reading  Multiple User inputs in a single variable
echo “Enter book names each separated by a space”
read -a varbooks
echo “${varbooks[0]}”
echo “${varbooks[1]}”
echo “${varbooks[2]}”
echo “${varbooks[3]}”

#===================================
#Reading User's input through command line (While executing a script)
echo “Command line values are: ”
echo “1st input value: $1”
echo “2nd input value: $2”
echo “3rd input value: $3”
echo “0th item is: $0”   


#===================================
#Special shell symbols/variables
echo "$@"
echo $@
echo "$#"
echo "$*"
echo exit status of previous command "$?"
echo "$$"
echo "$!"
echo a{1,3,4}
echo "a{1,3,4}"
echo
echo ~ "~"
echo ~+ "~+"
echo ~- "~-"


#===================================
#!/bin/bash
price=5 #Here ‘=’ is NSBA operator (NO spacing before and after ‘=’, always!)
quantity=10
#arithmetic operators: always involve integers!
sum=$((price+quantity)) #
#OR
#sum=`expr $price +|-|\*|/ $quantity` #Operators are NSBA, If * then use escape with \*. Use a space before and after +,-, \* and /
#OR
#sum=$(expr $price +|-|\*|/ $quantity)
#sum=$[$price + $quantity] #no spacing prob.
prod=$((price*quantity))
diff=$((price-quantity)) #does this give negative number?
quot=$((price/quantity)) #does this gives floating number?
echo “sum,prod,diff,quot =”, $sum, $prod, $diff, $quot

#===================================
#Arithmetic Operators/Incremnting a variable
myvar=$[$myvar + 1] #outdated, do NOT use
echo $myvar
myvar=`expr $myvar + 1` #do NOT use
echo $myvar
myvar=$(expr $myvar + 1 )
echo $myvar

#Confusing because not using $
echo "expressions w/o using \$"
((myvar+=1)) 
#just like myvar=$(($myvar+1)) #use it needed.
echo $myvar
((++myvar)) #pre-increment, don't use $
echo $myvar
((myvar++)) #post-increment, don't use $
echo $myvar


#===================================
#Application(s) of Relational Operators
#!/bin/bash
price=5 #assignment of variable.
quantity=10
#Relational operators
#logical operators: ==, !=, >, >=, <, <=
if (($price == $quantity));then
#spacing between operands and operator 
##inside (()) does not matter
echo "price and quantity are equal";
else
echo "price and quantity are NOT equal";
fi

if (($price > $quantity));then
echo "price greater than quantity";
else
echo "price less/eq to quantity";
fi


#===================================
#Applicaition(s) of Logical Operators in Shell
#!/bin/bash
a=”true” #assignment of variable.
b=”false”
#Logical operator operators
#Logical operators &, &&, ||, etc.
if (($a == “true” && $b == “true” ));then
echo "both are true";
else
echo "both are not true";
fi

if (($a == “true” ||  $b == “true” ));then
echo "either a or b is true";
else
echo "None are true.";
fi

if (($a == “true” && $b == “true” ));then
echo "both are true";
else
echo "both are not true";
fi

#===================================
#!/bin/bash
a=14
b=67
bitwiseAND=$(( a&b )) #2
echo Bitwise AND of a and b is $bitwiseAND


bitwiseOR=$(( a|b )) #79
echo Bitwise OR of a and b is $bitwiseOR
  
bitwiseXOR=$(( a^b )) #77
echo Bitwise XOR of a and b is $bitwiseXOR


#Complement
bitiwiseComplement=$(( ~a )) #-15
echo Bitwise Compliment of a is $bitiwiseComplement
  
leftshift=$(( a<<1 )) #28
echo Left Shift of a is $leftshift
  
rightshift=$(( b>>1 )) #33
echo Right Shift of b is $rightshift


##===================================
#Applications of floating point arithmetic in Shell
#!/bin/bash
price=5
quantity=10
#floating point arithmetic operators
quot=$((price/quantity)) #does this gives floating number?
fquot=`echo "$price / $quantity" | bc -l` #does give floating point value.
#OR
#fquot=$(echo "$price / $quantity" | bc -l) #substitution command/syntax

afquot= `echo - | awk"{print $price / $quantity}"`
echo $quot, $fquot
echo $afquot

min=12.45
val=10.35
if (("$(echo "${val} < ${min}" | bc)" == 1)); then  
    echo "minimum value is tested"
    min=${val} #new min.
fi
echo "min value is: $min"

Output:
0, 0.5
0.5
min value is: 10.35




##===================================
#Class Practice Problem-1
#Write a shell script named 'calc.sh' that takes three command line inputs, and performs 
#as a calculator as below:
#The first command line argument is a number
#The second command line argument is an operator
#The third command line arugment is another number.
Once given correct inputs, the script should display the result of the operation given 
through the command line.
For example, the script can be execuated as below to get desired result:
  $bash calc.sh 45 + 65
  Output: 110

  $bash calc.sh 200 \ 10
  Output: 20

  $bash calc.sh 30 \* 20
  Output: 600

#Class Practice Problem-2
# Write a shell script catlog.sh that takes user's 4 different data values (name, age, gpa and salary) on the command line.
# The script should also classify the user in different age groups and GPA groups as below.
    #Age Groups:
    # 0 - 14 child
    # 15 - 24 youth                      
    # 25 - 64 adults
    # 65 + senior

    #GPA Groups:
    pass: less than 3.0 total GPA
    cum laude: at least a 3.0 total GPA 
    magna cum laude: at least a 3.4 total GPA
    summa cum laude: at least a 3.7 total GPA

#Your program should display user's name, proper age group name and GPA group name according to user's command line inputs.

  #Example:
  #$./catlog.sh david 12 2.5 0
  Output:
  name: david
  age group: child
  GPA group: pass

  #$./catlog.sh rohan 42 3.9 42000
  Output:
  name: rohan
  age group: adults
  GPA group: magna cum laude

