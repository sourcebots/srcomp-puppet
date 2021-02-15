# Setting up a new production host

1. Spin up the VM. It needs to be a supported OS & version; see the
   `Vagrantfile` for the current target.

  **Note**: for TLS configuration to work correctly the hostname of the machine
  must match the public DNS name of the machine. If spinning up a Digtial Ocean
  box, this means the name of the machine you put into DO's UI must be the fully
  qualified name for the machine.

2. Login as root

3. Create a non-root user with `sudo` access:

    ```bash
    useradd --create-home --user-group --groups sudo $USERNAME
    ```

4. Set the password for that account (so it can `sudo`):

    ```bash
    passwd $USERNAME  # and then follow the prompts
    ```

5. Logout and log back in as that user. This is important because our puppet
   configuration removes `ssh` access for the root user.

   **Note**: the remainder of thes instructions require root access, so you
   probably want to `sudo su` at this point.

6. Configure key based SSH access for that user.

7. Repeat for another user, so that more than one person has access to
   administer the machine.

8. Bootstrap puppet:

    ```bash
    sudo apt install --yes puppet git
    rm -rf /etc/puppet
    git clone --recurse-submodules https://github.com/PeterJCLaw/srcomp-puppet /etc/puppet
    ```

9. Set up public DNS for the machine.

10. Run the install:

    ```bash
    /etc/puppet/scripts/install
    ```

11. Update as needed if things change in puppet:

    ```bash
    /etc/puppet/scripts/update
    ```