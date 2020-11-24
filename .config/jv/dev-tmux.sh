#!/bin/sh
tmux new-session -s 'fs' -n 'servers' -d
tmux send-keys -t 'servers' Enter
tmux new-window -n 'code'
tmux send-keys -t 'code' Enter
tmux -2 attach-session -d