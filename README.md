# ansible-fedora-setup

A straightforward ansible playbook that sets up a fresh Fedora install (>= 42). Installs & removes packages, sets up shell and more.

>[!NOTE]
>One shoe does not fit all feet; this playbook reflects my preferences and choice of tools when developing. Make sure to adjust the playbook to your personal needs!

## Remote usage

1. Install [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) on local machine

2. Create file `hosts.yaml` in current directory

```yaml
all:
  hosts:
    remote-machine:
```

3. Copy ssh-key to remote machine

```bash
ssh-copy-id 192.168.1.123
```

4. Run the playbook

> [!WARNING]  
> Never blindly run scripts from the web, including this playbook. Make sure you understand its content.


```bash
# for a workstation
ansible-playbook  workstation.yaml -K

# for a server
ansible-playbook  server.yaml -K
```

## Local usage

You can run the playbook directly on localhost with the following command.

> [!WARNING]  
> Note the comma: `localhost,`


```bash
ansible-playbook -i localhost, -c local 
```
