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

#Reading user's input in a shell program
echo “Enter date of purchase: ”
read varpd
echo “Purchase date:$varpd”
echo -p “Enter edition and publisher’s name: ” vared

#Reading  Multiple User inputs in a single variable
echo “Enter book names each separated by a space”
read -a varbooks
echo “${varbooks[0]}”
echo “${varbooks[1]}”
echo “${varbooks[2]}”
echo “${varbooks[3]}”

#Reading User's input through command line (While executing a script)
echo “Command line values are: ”
echo “1st input value: $1”
echo “2nd input value: $2”
echo “3rd input value: $3”
echo “0th item is: $0”      

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

                         



