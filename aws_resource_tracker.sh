#!/bin/bash

########################
#Author : Sandra
#Date : 25-July
#
#Version v1
#
#This script will report the AWS resource usage
########################
#AWS S3
#AWS EC2
#AWS Lambda
#AWS Iam Users


# Set log file
LOG_FILE="/home/ubuntu/aws_resource_tracker_output.log"

# Add timestamp
echo "========== AWS Resource Tracker Run at $(date) ==========" >> "$LOG_FILE"

# List S3 Buckets
echo -e "\n--- S3 Buckets ---" >> "$LOG_FILE"
aws s3 ls >> "$LOG_FILE" 2>&1

# List EC2 Instances
echo -e "\n--- EC2 Instances ---" >> "$LOG_FILE"
aws ec2 describe-instances --query 'Reservations[*].Instances[*].InstanceId' --output text >> "$LOG_FILE" 2>&1

# List Lambda Functions
echo -e "\n--- Lambda Functions ---" >> "$LOG_FILE"
aws lambda list-functions >> "$LOG_FILE" 2>&1

# List IAM Users
echo -e "\n--- IAM Users ---" >> "$LOG_FILE"
aws iam list-users >> "$LOG_FILE" 2>&1

echo -e "\n=========================================================\n" >> "$LOG_FILE"
