#!/bin/bash

HOSTNAME="sandbox3" #Name should not contains special char, only "-"
LOGIN_USER1="pfs"
SSH_KEY_USER1="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCOUuzuAFSB+VEzvtCpCJfVc/p/qplLPyd3VSlot/VuRDdd9i71jJT34dDW13SiGG/XQr15ABlZdujdRbb3x1SgD/+smp4rdF6mMNkAIienT2tnYiB0uUO6zTjrZ8ObcaVuUw8csqNoyeisbf9ERwHt1U8dyplv9pkUsRv9oxZzFskfqnKdAb/2NOdedl8K0Fx0OIYmPCiGjmc2AlBQnL6lcAbTlS7zLISk661MVfCL/TLjARQ8GfcMCFV019YtYhwY/WI5JuQ7+lp+o3ByljHS5VjFXr/Qi/XQspO2TaqBRJSQBrWC0Spm7xkdferMtUJa6PiVR1w2FmUPdgIOFJBR pfs-prod"

# Account/Group creation
useradd -m -d /home/${LOGIN_USER1} -s /bin/bash -U ${LOGIN_USER1}
su - ${LOGIN_USER1} -c "mkdir /home/${LOGIN_USER1}/.ssh"
su - ${LOGIN_USER1} -c "chmod 700 /home/${LOGIN_USER1}/.ssh"
su - ${LOGIN_USER1} -c "echo '${SSH_KEY_USER1}' > /home/${LOGIN_USER1}/.ssh/authorized_keys"
su - ${LOGIN_USER1} -c "chmod 400 /home/${LOGIN_USER1}/.ssh/authorized_keys"

# Add group in sudoers
echo "#Allow members of group ${LOGIN_USER1} to execute any command" > /etc/sudoers.d/${LOGIN_USER1}_conf
echo "%${LOGIN_USER1}   ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers.d/${LOGIN_USER1}_conf
chmod 0440 /etc/sudoers.d/${LOGIN_USER1}_conf

# Hostname modification
echo ${HOSTNAME} > /etc/hostname
hostname ${HOSTNAME}
echo "#Entry added manually after changing the hostname" >> /etc/hosts
echo "127.0.0.1 ${HOSTNAME}" >> /etc/hosts

# GitHub files deletion
rm -f /tmp/script.sh
