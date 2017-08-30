# based on https://github.com/oh-my-fish/theme-cmorrell.com


set -g pad " "

## Function to show current time prompt was rendered
function show_time
  set -l time (date +%H:%M:%S)
  prompt_segment normal yellow "$time"
end

## Function to show a segment
function prompt_segment -d "Function to show a segment"
  # Get colors
  set -l bg $argv[1]
  set -l fg $argv[2]

  # Set 'em
  set_color -b $bg
  set_color $fg

  # Print text
  if [ -n "$argv[3]" ]
    echo -n -s $argv[3]
  end
end

## Function to show current status
function show_status -d "Function to show the current status"
  if [ $RETVAL -ne 0 ]
    prompt_segment magenta white " ▲ "
    set pad ""
    end
  if [ -n "$SSH_CLIENT" ]
      prompt_segment blue white " SSH: "
      set pad ""
    end
end

function show_virtualenv -d "Show active python virtual environments"
  if set -q VIRTUAL_ENV
    set -l venvname (basename "$VIRTUAL_ENV")
    prompt_segment normal white " ($venvname)"
  end
end

# Show directory
function show_pwd -d "Show the current directory"
  set -l pwd (prompt_pwd)
  prompt_segment normal blue "$pad$pwd"
end

# reuse builtin git prompt function
function show_git_prompt
  set -g __fish_git_prompt_show_informative_status true
  set -g __fish_git_prompt_showcolorhints true
  __fish_git_prompt
end

# Show prompt w/ privilege cue
function show_prompt -d "Shows prompt with cue for current priv"
  set -l uid (id -u $USER)
  if [ $uid -eq 0 ]
    prompt_segment red white " ! "
    set_color normal
    echo -n -s " "
  else
    prompt_segment normal white " \$ "
  end

  set_color normal
end

## SHOW PROMPT
function fish_prompt
  set -g RETVAL $status
  show_status
  show_time
  show_virtualenv
  show_pwd
  show_git_prompt
  show_prompt
end
