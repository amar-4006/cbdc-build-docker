#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or fallback to 9001
USER_ID=${LOCAL_USER_ID:-9001}
GROUP_ID=${LOCAL_GROUP_ID:-9001}

echo "Starting with UID : $USER_ID"
groupadd -g $GROUP_ID dev 
useradd --shell /bin/bash -u $USER_ID -g $GROUP_ID -o -c "" -m dev
export HOME=/home/dev

# Setup sudo for the user
echo "dev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

#mkdir /home/dev/work

# Ensure correct ownership of the work directory
chown dev:dev /home/dev/work
sudo chown dev:dev  /usr/local/bin/setup_opencbdc.sh

# Execute the command as the user
exec gosu dev "$@"

