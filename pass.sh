#!/bin/bash

# Random Password Generator

# Default values
length=12
count=1
special_chars=true
numbers=true
uppercase=true
lowercase=true

# Function to display help
function show_help {
    echo "Usage: $0 [OPTIONS]"
    echo "Generate random passwords"
    echo ""
    echo "Options:"
    echo "  -l, --length NUMBER    Set password length (default: 12)"
    echo "  -c, --count NUMBER     Number of passwords to generate (default: 1)"
    echo "  -ns, --no-special      Don't include special characters"
    echo "  -nn, --no-numbers      Don't include numbers"
    echo "  -nu, --no-uppercase    Don't include uppercase letters"
    echo "  -nl, --no-lowercase    Don't include lowercase letters"
    echo "  -h, --help             Display this help and exit"
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -l|--length)
            length="$2"
            shift 2
            ;;
        -c|--count)
            count="$2"
            shift 2
            ;;
        -ns|--no-special)
            special_chars=false
            shift
            ;;
        -nn|--no-numbers)
            numbers=false
            shift
            ;;
        -nu|--no-uppercase)
            uppercase=false
            shift
            ;;
        -nl|--no-lowercase)
            lowercase=false
            shift
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
done

# Ensure at least one character type is selected
if [[ "$special_chars" == "false" && "$numbers" == "false" && "$uppercase" == "false" && "$lowercase" == "false" ]]; then
    echo "Error: At least one character type must be enabled."
    exit 1
fi

# Generate passwords
for ((i=1; i<=$count; i++)); do
    # Build character set based on selected options
    chars=""
    
    if [[ "$lowercase" == "true" ]]; then
        chars="${chars}abcdefghijklmnopqrstuvwxyz"
    fi
    
    if [[ "$uppercase" == "true" ]]; then
        chars="${chars}ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    fi
    
    if [[ "$numbers" == "true" ]]; then
        chars="${chars}0123456789"
    fi
    
    if [[ "$special_chars" == "true" ]]; then
        chars="${chars}!@#$%^&*()-_=+[]{};:,.<>/?"
    fi
    
    # Generate password
    password=""
    for ((j=1; j<=$length; j++)); do
        # Get a random character from the character set
        random_char_index=$((RANDOM % ${#chars}))
        password="${password}${chars:$random_char_index:1}"
    done
    
    echo "Password $i: $password"
done
