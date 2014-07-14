# vim:ft=sh

# ripped from this http://superuser.com/a/141241 thread, where the author stated
# being ok with it ending up in a public git repo

function sshagent_findsockets {
    find /tmp -uid $(id -u) -type s -name agent.\* 2>/dev/null
}

function sshagent_testsocket {
    if [ ! -x "$(which ssh-add)" ] ; then
        echo "ssh-add is not available; agent testing aborted"
        return 1
    fi

    if [ X"$1" != X ] ; then
        export SSH_AUTH_SOCK=$1
    fi

    if [ X"$SSH_AUTH_SOCK" = X ] ; then
        return 2
    fi

    if [ -S $SSH_AUTH_SOCK ] ; then
        ssh-add -l > /dev/null
        if [ $? = 2 ] ; then
            echo "Socket $SSH_AUTH_SOCK is dead!  Deleting!"
            rm -f $SSH_AUTH_SOCK
            return 4
        else
            echo "Found ssh-agent $SSH_AUTH_SOCK"
            return 0
        fi
    else
        echo "$SSH_AUTH_SOCK is not a socket!"
        return 3
    fi
}

function sshagent_init {
    # ssh agent sockets can be attached to a ssh daemon process or an
    # ssh-agent process.

    AGENTFOUND=0

    # Attempt to find and use the ssh-agent in the current environment
    if sshagent_testsocket ; then AGENTFOUND=1 ; fi

    # If there is no agent in the environment, search /tmp for
    # possible agents to reuse before starting a fresh ssh-agent
    # process.
    if [ $AGENTFOUND = 0 ] ; then
        for agentsocket in $(sshagent_findsockets) ; do
            if [ $AGENTFOUND != 0 ] ; then break ; fi
            if sshagent_testsocket $agentsocket ; then AGENTFOUND=1 ; fi
        done
    fi

    # If at this point we still haven't located an agent, it's time to
    # start a new one
    if [ $AGENTFOUND = 0 ] ; then
        eval `ssh-agent`
    fi

    # Clean up
    unset AGENTFOUND
    unset agentsocket

    # Finally, show what keys are currently in the agent
    ssh-add -l
}

alias sagent="sshagent_init"
