#!/bin/bash
#
#
filename="$1"
#
cat $filename | while read LINE
do
    echo "connecting to $LINE and running chef-client command.."
#    sshpass -p "gamut" ssh gamut@$LINE "sudo chef-client"
knife ssh 'name:gamut' 'sudo chef-client' --ssh-user gamut --ssh-password 'gamut' --attribute $LINE
    echo "Chef-client command run completed!"
done

