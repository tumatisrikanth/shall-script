#!/bin/bash
# creaton of multiple usernames and generate random password and generate new password
user=$@
if [ $# -gt 0 ]; then
    for username in $user; do
        exuser=$(cat /etc/passwd | grep -w $username | cut -d ":" f1)
        if [ "$username" = "$exuser" ]; then
            echo "user exits, please use a different username"
        else
            spec=$(echo '!@#$%^&*()_' | fold -w1 | shuf | head -1)
            password=india@${random}${spec}
            echo "lets create user $username"
            useradd -m $username
            echo "${username}:${password}" | sudo chpasswd
            passwd -e ${username}
            #provide password
            echo "username is ${userneme} password is ${password}"
        fi
    done
else
    echo "provide some input"
fi


