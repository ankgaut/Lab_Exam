#!/bin/bash
#Ankur Gautam
#160127
#Starting Time: Jan 21 2018 4:46 am 
#Ending Time: Jan 22 2018 3:06 am 

global_f () {
    global_l=$1
    global_n=$2 
}

printd () {
    names=$( ls $1 )
    local d=$(( $2 + 1 ))
    local sum_dl=0
    local sum_dn=0
          
    cd $1    
    
    for name in $names        
    do
        if [ -d $name ] 
        then            
            printd $name $d
            (( sum_dl += global_l ))
            (( sum_dn += global_n ))
            
        else
            sum_fl=0
            sum_fn=0
            
            z=$( cat $name | grep -o -E '[0-9]*[0-9]' | wc -l )
            y=$( cat $name | grep -o -E '[0-9]\.[0-9]' | wc -l )
            x=$(( y * 2))
            sum_fn=$(( $z - $x ))
            
            z=$( cat $name | grep -o -E '\w[.?!]' | wc -l )
            sum_fl=$(( $z - $y ))
             
            counter=0
            while [ $counter -lt $d ]
            do 
                echo -ne "\t"
                ((counter++))
            done
            echo "(F) $name-$sum_fl-$sum_fn"
            ((sum_dl += sum_fl))
            ((sum_dn += sum_fn))
            
        fi        
    done
    
    
    
    cd ..
    
    global_f $sum_dl $sum_dn
    
    counter=0
    
    while [ $counter -lt $2 ]
    do      
        echo -ne "\t" 
        (( counter++ ))
    done
    
    
    echo "(D) $1-$sum_dl-$sum_dn"    
}


let dist=0 
printd $1 $dist


exit



