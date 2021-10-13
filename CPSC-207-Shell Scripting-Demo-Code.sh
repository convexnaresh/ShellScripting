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


##===========In-class problem========================
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


##===========In-class problem========================
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
  
  
#HINTS:
#You can use following syntax to test gpa in decimal:

#!/bin/bash
gpa=3.6 
rng1=3.4 #lower bound
rng2=3.7 #upper bound
#check the range where gpa falls.
if (("$(echo "$gpa < $rng2" | bc )" == 1 && "$(echo "$gpa > $rng1" | bc )" == 1 )); then
    echo "magna cum laude";
fi   
 
 #OR, w/o outer quote.
 #check the range where gpa falls.
if (($(echo "$gpa < $rng2" | bc ) == 1 && $(echo "$gpa > $rng1" | bc ) == 1 )); then
    echo "magna cum laude";
fi 


##===================================
# Test command and alternative of using test command using [ expr ] and [[ expr ]]

#Switch Statements


##===================================
#Looping Structure

#Type-1
#!/bin/bash
for i in 1 2 3 4 5
do
    echo "Welcome $i times"
done

#Type-2
#!/bin/bash
for i in {0..10..2}
do
    echo "Welcome $i times"
done

#C-Type
#!/bin/bash
for (( i=0; i<=10; i=i+2 ))
do
    echo "Welcome $i times"
done

#Type-3, General 
#!/bin/bash
for $i in $(seq 0 2 10)
do
    echo "Welcome $i times"
done

##===================================
#Applications of loops
#Doing task for multiple times.
#!/bin/bash
touch myfile.txt
for i in {1..5}
do
    cp myfile.txt "myfile-$i.txt";
    #other commands and logic
done

#Processing output of a command.
#!/bin/bash
for var in $(ls)
do
    echo "Processing file $var"
    #check if var ends with .txt and apply the required operation to the file variable.
    #other commands and logic
done

#Processing user's input throug command line
#!/bin/bash
for var in $@
do
    echo $var
    #Your logic
    #Example: check if var is a number or string   
    #if number then echo "$var is a number"
    #else echo "$var is a string"
done

#processing a file word by word.
for word in $(cat filename.txt)
do
    echo $word
    #other commands and logic
done

What happens when you put double quote around $(cat filename.txt)?
Ans: Try it.

#processing a file line by line : Use WHILE loop
while read varline; 
do 
    echo "$varline"
done < filename.txt


#processing a file word by word in each line;
while IFS="" read -r field1 field2 field3 field4
do
    echo $field1
    echo $field2
    echo $field3
done < filename.txt

#processing a file word by word in each line; give a file descriptor 78 to the opened file.
while IFS="" read -r 78 field1 field2 field3 field4
do
    echo $field1
    echo $field2
    echo $field3
done 78< filename.txt

##===========In-class problem========================
#Class Practice Problem-3

#Write a shell script that undo the work you did as part of Programming Assignment-2.
#Look into the following items of the task you completed while doing the assignment: 
# 1. What user accounts you created on your system.
  # Write them in a file schoolusers.txt, all separated by a space
  #Remember, you do not write your username in the file.
  # You need to remove all users in the file.
  Hint: Use looping to remove user one by one.

  #!/bin/bash
  userfile=schoolusers.txt
  for uservar in $(cat $userfile)
  do
    #remove the user, uservar
    sudo userdel $uservar #use -r option to delete home directory
  done
  

# 2. What groups you created on your system.
  # Write them in a file schoolgroups.txt, all separated by a space
  # You need to delte all groups in the file.
  Hint: Use looping to remove groups by one.
  
# 3. What directories (find out their absolute path) you created to share among users and groups.
  # Write them in a file schooldirs.txt, all separated by a space
  # You need to delete all directories in the file.
  Hint: Use looping to remove dir one by one.

# Again, in other words, write a shell script to undo task 1-3.


##===========In-class problem========================
#Class Practice Problem-4

#Write a shell script that completes the task of Programming Assignment-2.
#Look into the following items of the task you need to complete.
# 1. What user accounts you must create on your system.
  # Write them in a file schoolusers.txt, all separated by a space
  # You need to create all users in the file.
  Hint: Use looping to add user one by one.
  #How do you assign a new password to the user?
  
# 2. What groups you must create on your system.
  # Write them in a file schoolgroups.txt, all separated by a space
  # You need to create all groups in the file.
    Hint: Use looping to add group one by one.
    
# 3. What directories (find out their absolute path) you must create to share among users and groups you create in 1 and 2.
  # Write them in a file schooldirs.txt, all separated by a space
  # You need to crate all directories in the file.
    Hint: Use looping to create directories one by one.
  
# 4. Assign all directories the proper ownerships and permissions to the users and groups 
  
# Again, in other words, write a shell script to performs task 1-4.

  
  

