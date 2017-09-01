function m -d "start mutt"
    set accountname $argv[1]
    set --erase argv[1]
    cd ~/Downloads
    mutt -n -e "source ~/.mutt/accounts/$accountname" $argv
end
