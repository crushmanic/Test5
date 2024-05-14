#!/bin/bash

#This function performs a TCP SYN SCAN
tcp_syn_scan() {
echo "starting/performing a tcp syn scan $1..."
     sudo  nmap -sT -p- $1
}

#This function performs a stealth scan
stealth_scan() {
echo "performing a stealth scan $1..."
     sudo nmap -T4 -sS $1 
}


#This function performs a UDP scan
udp_scan() {
echo "performing a udp scan $3..."
     sudo  nmap  -sU  $1
}

# Function to perform OS detection
os_detection() {
    echo "Performing OS detection on $1..."
    sudo nmap -O $1
}

# Function to perform version detection
version_detection() {
    echo "Performing version detection on $1..."
    sudo nmap -sV $1
}

# Function to perform service enumeration
service_enum() {
    echo "Performing service enumeration on $1..."
    sudo nmap -sV --version-intensity 5 $1
}

# Function to perform Nmap script scan
script_scan() {
    echo "Performing Nmap script scan on $1..."
    sudo nmap -p- -sCV --min-rate=1000 $1
}
# Function to perform timing and performance scan
timing_perf_scan() {
    echo "Performing timing and performance scan on $1..."
    sudo nmap -T4 -A $1
}

# Function to perform port scan
port_scan() {
    echo "Performing port scan on $1..."
    sudo nmap -p- $1
}

# Function to perform advanced scan with custom options
advanced_scan() {
    echo "Performing advanced scan on $1 with custom options..."
    sudo nmap -f -t 0 -n -Pn --data-length 200 -D $1
}

# Function to perform Firewall/ IDS Evasion and spoofing 
evasion_scan() {
echo "Performing Firewall evasion  scan  on $1..."
     sudo nmap -f  $1
}
 

#validate/confirm ip address
validate_ip() {
  local ip=$1
  if [[ $ip =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
    echo "Valid IP address format."
  else
    echo "Invalid IP address format."
    exit 1
  fi
}


#The main function starts the execution of the scripts
main() {
   clear
   echo "Welcome to nmap scanner  xxxxxx.........."
   sleep 3
   echo "Please enter the IP address you want to scan"
   read  ip_address

# Validate IP address
    validate_ip $ip_address

    echo "Select the type of scan you want to perform:"
    echo "1. TCP SYN scan"
    echo "2. Stealth scan"
    echo "3. UDP scan"
    echo "4. OS detection"
    echo "5. Version detection"
    echo "6. Service enumeration"
    echo "7. Nmap script scan"
    echo "8. Timing and performance scan"
    echo "9. Port scan"
    echo "10. Advanced scan"
    echo "11. Evasion  scan"
    read -p "Enter your choice: " choice

    case $choice in
        1) echo "Performing TCP SYN scan on $ip_address..."; sudo nmap -sT -p- $ip_address ;;
        2) echo "Performing Stealth scan on $ip_address..."; sudo nmap -T4 -sS $ip_address ;;
        3) echo "Performing UDP scan on $ip_address..."; sudo nmap -sU $ip_address ;;
        4) echo "Performing OS detection on $ip_address..."; sudo nmap -O $ip_address ;;
        5) echo "Performing version detection on $ip_address..."; sudo nmap -sV $ip_address ;;
        6) echo "Performing service enumeration on $ip_address..."; sudo nmap -sV --version-intensity 5 $ip_address ;;
        7) echo "Performing Nmap script scan on $ip_address..."; sudo nmap -p- -sCV --min-rate=1000 $ip_address ;;
        8) echo "Performing timing and performance scan on $ip_address..."; sudo nmap -T4 -A $ip_address ;;
        9) echo "Performing port scan on $ip_address..."; sudo nmap -p- $ip_address ;;
        10)echo "Performing advanced scan on $ip_address...";  sudo nmap -f -t 0 -n -Pn --data-length 200 -D $ip_address ;;
        11)echo "Performing Firewall evasion  on $ip_address..."; sudo nmap -f $ip_address ;;
        *) echo "Invalid choice. Exiting." ;;
    esac
}

# Call the main function
main
