# sre_work_samples.VAMSHI.MEDETHENAPALLI

############--------------Sample Tech Challange -1 -------------------################


#!/bin/bash

passwd=$1
group=$2
if [ -z "$passwd" ] | [ -z "$group" ];
  then
    echo "Please pass exactly two arguments with absolute path: 1) passwd file 2)group file"
    echo "Example usage: most_active_group /etc/passwd /etc/group"
    exit 1
fi
high_user=NULL
count=0
for user in `cat $passwd | egrep "bash$|sh$"| awk -F: '{ print $5 }' | tr ',' '\n' |sort`
  do
    high_user=$user
    if [ $high_user == $user ];
      then let "count++";
    fi;
  done
  echo $high_user:$count


Running this shell script:
-> Make sure that the sheel script file has the execution permissions.
-> `sh <Shell Script file name>.sh argument1 argument2`
-> argument1 filename1 [ex:/etc/passwd ]
-> argument2` filname2 [ex: /etc/group]

Script working flow:
-> Intially script will check if the place holders "passwd and group" are not null.
-> Then in the next snippet of the script it will intilize a count variable
-> Now it will use awk utility and iterate through the provided input files and start counting the no.of users in the group and assign it to the variable high_user
-> Now it will display the name of the highest user group and no.of users in that group












































# Terraform-AWS
Assignment-1
------------------------------------------------------------------------------------------------------------------------------------------

Added the practice code discussed in session.

Creation of a basic network with provate and public subnets and creating NAT instance and mapping routes to the subnets, Using the subnets created launched a public(web server) and private instance (DB/Backend instances).

 -> Basics of terraform & its background and how its different from other infra-provisoning & CM tools.
 -> Different Kinds of provisioners available.
 -> File structure of a terraform code.
 -> Basic commands overview.
 -> Assignment-1 Practical -1 ( Creation of AWS Ec2 instance with only specifc access to s3 bucket by using the IAM Instance profile by creating an assume role and a policy. To understand the work-flow of terraform and how it works.
 -> Practical-2 (VPC creation in AWS and using it to launch public and private subnets)
 
 Assignment-2
 -----------------------------------------------------------------------------------------------------------------------------------------
 Understanding terraform grammer (how to declare variables and interpolate in the resource creation code) - Already discussed in 1st assignment.
 
 Practical-1( Creating Windows Server by using the resources and creating all other respurces required and using user-data to just do few customizations) - On Wednesday
 -> Going through the important resources available in terraoform to accomlish various usecases in cloud services provisioning.
 -> Looking in how to work with azure cloud with a small practice.
 
 
 
 
 
