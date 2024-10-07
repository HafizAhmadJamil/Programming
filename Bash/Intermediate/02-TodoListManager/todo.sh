#!/bin/bash

TODO_FILE="todo_list.txt"

# Function to display the menu
display_menu() {
    echo "To-Do List Manager"
    echo "=================="
    echo "1. Add a Task"
    echo "2. View Tasks"
    echo "3. Remove a Task"
    echo "4. Mark a Task as Completed"
    echo "5. Exit"
    echo -n "Choose an option [1-5]: "
}

# Function to add a task
add_task() {
    echo -n "Enter the task: "
    read task
    echo "$task" >> "$TODO_FILE"
    echo "Task added."
}

# Function to view tasks
view_tasks() {
    if [[ -f "$TODO_FILE" && -s "$TODO_FILE" ]]; then
        echo "Current Tasks:"
        nl -w2 -s'. ' "$TODO_FILE"
    else
        echo "No tasks found."
    fi
}

# Function to remove a task
remove_task() {
    view_tasks
    echo -n "Enter the task number to remove: "
    read task_number
    sed -i "${task_number}d" "$TODO_FILE"
    echo "Task removed."
}

# Function to mark a task as completed
mark_completed() {
    view_tasks
    echo -n "Enter the task number to mark as completed: "
    read task_number
    sed -i "${task_number}s/$/ (completed)/" "$TODO_FILE"
    echo "Task marked as completed."
}

# Main loop
while true; do
    display_menu
    read choice

    case $choice in
        1) add_task ;;
        2) view_tasks ;;
        3) remove_task ;;
        4) mark_completed ;;
        5) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
    echo ""
done
