#!/bin/bash
#Ankur Gautam
#160127 
#Assignment 1 Question 1
#Start Time: Jan 20 2018 6:43 pm
#End Time: Jan 21 2018 3:13 am


a=$( echo $1 | sed 's_\([0-9]\)\,\([0-9]\)_\1\2_g' )    
#comma removed

one_digit () {
    case $1 in 
        1)
            echo -n "one "
            ;;
        2)
            echo -n "two "
            ;;
        3)
            echo -n "three "
            ;;
        4)
            echo -n "four "
            ;;
        5)
            echo -n "five "
            ;;
        6)
            echo -n "six "
            ;;
        7)
            echo -n "seven "
            ;;
        8)
            echo -n "eight "
            ;;
        9)
            echo -n "nine "
            ;;
    esac
}

two_digit () {    
    if [ $1 -gt 19 ]
    then
        y=$(( $1 / 10 ))
        
        case $y in 
            2)
                echo -n "twenty "
                ;;
            3)
                echo -n "thirty "
                ;;
            4)
                echo -n "forty "
                ;;
            5)
                echo -n "fifty "
                ;;
            6)
                echo -n "sixty "
                ;;
            7)
                echo -n "seventy "
                ;;
            8)
                echo -n "eighty "
                ;;
            9)
                echo -n "ninety "
                ;;    
        esac
        z=$(( $1 % 10 ))
        
        one_digit $z
            
    elif [ $1 -lt 10 ]
    then
        one_digit $1
        
    else  
        case $1 in
            10)
                echo -n "ten "
                ;;        
            11)
                echo -n "eleven "
                ;; 
            12)
                echo -n "twelve "
                ;; 
            13)
                echo -n "thirteen "
                ;; 
            14)
                echo -n "fourteen "
                ;; 
            15)
                echo -n "fifteen "
                ;; 
            16)
                echo -n "sixteen "
                ;; 
            17)
                echo -n "seventeen "
                ;; 
            18)
                echo -n "eighteen "
                ;; 
            19)
                echo -n "nineteen "
                ;; 
        esac            
    fi         
}

func () {
    l=$(( $1 / 100000 ))
    if [ $l -ne 0 ]
    then
        two_digit $l    
        echo -n "lakh "
    fi
    
    tmp=$(( $1 % 100000 ))
    t=$(( tmp / 1000 ))
    if [ $t -ne 0 ]
    then
        two_digit $t
        echo -n "thousand "
    fi
    
    remain=$(( $tmp % 1000 ))
    h=$(( $remain / 100 ))
    if [ $h -ne 0 ]
    then
        one_digit $h
        echo -n "hundred "
    fi
    
    tens=$(( $remain % 100 ))
    two_digit $tens    
}

charc='[^0-9]'
if [[ $a =~ $charc ]]
then 
    echo invalid input
    exit -1
fi
#if any character other than digits prints invalid input

regex='[1-9][0-9]{0,}'

if [[ $a =~ $regex ]]
then 
    b=$( echo $a | sed 's/^0*//' )
    
    if [ ${#b} -gt 11 ]    
    then
    echo invalid input
    exit -1
    fi
    
    c=$(( $b / 10000000))
    
    if [ $c -ne 0 ]
    then 
        func $c
        echo -n "crore "
    fi
    
    d=$(( $b % 10000000))
    func $d
    echo -ne "\n"
    exit 0 
else 
    echo zero
    exit 0
fi 







