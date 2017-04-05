#!/bin/bash
c=1
while [ $c = 1 ]
do
        echo "Enter your selection"
        echo "1.List rules  2.Add rules 3.Delete rules 4.Exit"
        read s1
        if [ $s1 = 1 ]
                then
                firewall-cmd --list-all
        elif [ $s1 = 2 ]
                then
                echo "1. Port  2.Service name"
                read s2
                echo "Enter zone"
                read zone
                if [ $s2 = 1 ]
                        then
                        echo "Enter Port number"
                        read p
                        echo "Enter Protocol type"
                        echo "tcp or udp"
                        read proto
                        firewall-cmd --permanent --zone=$zone --add-port=$p/$proto
                        firewall-cmd --reload
                elif [ $s2 = 2 ]
                        then
                        echo "Enter service name"
                        read sn
                        firewall-cmd --permanent --zone=$zone --add-service=$sn
                        firewall-cmd --reload
                fi
        elif [ $s1 = 3 ]
                then
                echo "1. Port  2.Service name"
                read s3
                echo "Enter zone"
                read zone
                if [ $s3 = 1 ]
                        then
                        echo "Enter Port number"
                        read p
                        echo "Enter Protocol type"
                        echo "tcp or udp"
                        read proto
                        firewall-cmd --permanent --zone=$zone --remove-port=$p/$proto
                        firewall-cmd --reload
                elif [ $s3 = 2 ]
                        then
                        echo "Enter service name"
                        read sn
                        firewall-cmd --permanent --zone=$zone --remove-service=$sn
                        firewall-cmd --reload
                fi
        else [ $s1 = 4 ]
                exit
        fi
done
