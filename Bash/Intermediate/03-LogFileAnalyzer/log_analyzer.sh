#!/bin/bash

# Prompt for the log file
echo -n "Enter the path to the log file: "
read LOG_FILE

# Function to display the menu
display_menu() {
    echo "Log File Analyzer"
    echo "=================="
    echo "1. Count Total Lines"
    echo "2. Count Specific Errors"
    echo "3. Display Most Frequent Words"
    echo "4. Filter Logs by Date Range"
    echo "5. Exit"
    echo -n "Choose an option [1-5]: "
}

# Function to count total lines
count_lines() {
    echo "Using log file: $LOG_FILE"  # Debug line
    total_lines=$(wc -l < "$LOG_FILE" 2>/dev/null)
    if [[ $? -ne 0 ]]; then
        echo "Error: Could not access the log file. Please check the path."
        return
    fi
    echo "Total Lines: $total_lines"
}

# Function to count specific errors
count_errors() {
    echo -n "Enter the error keyword to count: "
    read error_keyword
    error_count=$(grep -ci "$error_keyword" "$LOG_FILE")
    echo "Count of '$error_keyword': $error_count"
}

# Function to display most frequent words
most_frequent_ips() {
    echo "Most Frequent words:"
    awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 10
}

# Function to filter logs by date range
filter_logs() {
    echo -n "Enter start date (YYYY-MM-DD): "
    read start_date
    echo -n "Enter end date (YYYY-MM-DD): "
    read end_date
    echo "Logs from $start_date to $end_date:"
    awk -v start="$start_date" -v end="$end_date" '$0 ~ start, $0 ~ end' "$LOG_FILE"
}

# Main loop
while true; do
    display_menu
    read choice

    case $choice in
        1) count_lines ;;
        2) count_errors ;;
        3) most_frequent_ips ;;
        4) filter_logs ;;
        5) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
    echo ""
done
