# ansible-fedora-setup

A straightforward ansible playbook that sets up a fresh Fedora Workstation install (>= 41). Installs & removes packages, sets up shell and more.

>[!NOTE]
>One shoe does not fit all feet; this playbook reflects my preferences and choice of tools when developing. Make sure to adjust the playbook to your personal needs!

### Prerequisites

1. Install [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

2. Create file `hosts.yaml` in current directory

```yaml
all:
  hosts:
    my-machine:
```

3. Copy ssh-key to machine

```bash
ssh-copy-id 192.168.1.123
```

4. Run the playbook

> [!WARNING]  
> Never blindly run scripts from the web, including this playbook. Make sure you understand its content.

```bash
ansible-playbook  workstation.yaml -K
```