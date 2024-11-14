# tmux (Terminal Multiplexer) is a powerful tool that allows users to manage multiple terminal sessions inside a single window or session. It is especially useful for long-running processes, as you can detach from a session and reattach later without interrupting the running process. Here’s how to use tmux for executing scripts in multiple sessions.

#sudo apt-get install tmux
#!/bin/bash

# Array of script names (you can modify these to your actual script paths)
scripts=("script1.sh" "script2.sh" "script3.sh")

# Loop through each script and create a new tmux session
for script in "${scripts[@]}"; do
    # Get the base name of the script (without path)
    base_name=$(basename "$script" .sh)

    # Start a new tmux session for each script
    tmux new-session -d -s "$base_name" "./$script; read -p 'Press enter to close this session...'"
    
    echo "Started tmux session '$base_name' running $script"
done

echo "All scripts are running in separate tmux sessions."





Start a new tmux session:

CopyReplit
tmux new -s session_name
Detach from a session:
Press Ctrl + b, then d.

List all sessions:

CopyReplit
tmux ls
Attach to an existing session:

CopyReplit
tmux attach -t session_name
Kill a session:

CopyReplit
tmux kill-session -t session_name
