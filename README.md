# ansible-fedora-setup

A straightforward ansible playbook that sets up a fresh Fedora install (>= 42). Installs & removes packages, sets up shell and more.

>[!NOTE]
>One shoe does not fit all feet; this playbook reflects my preferences and choice of tools when developing. Make sure to adjust the playbook to your personal needs!

## Remote usage

1. Install `ansible` and `python3-psutil`

```bash
sudo dnf install -y ansible python3-psutil
```

2. Clone this repository

```bash
git clone https://github.com/FjellOverflow/ansible-fedora-setup.git && cd ansible-fedora-setup
```

3. Create file `hosts.yaml` in current directory

```yaml
all:
  hosts:
    remote-machine:
```

4. Copy ssh-key to remote machine

```bash
ssh-copy-id 192.168.1.123
```

5. Run the playbook

> [!WARNING]  
> Never blindly run scripts from the web, including this playbook. Make sure you understand its content.


```bash
# for a workstation
ansible-playbook workstation.yaml -K

# for a server
ansible-playbook server.yaml -K
```

## Local usage

1. Install `ansible` and `python3-psutil`

```bash
sudo dnf install -y ansible python3-psutil
```

2. Run the playbook

> [!WARNING]  
> Note the comma: `localhost,`

```bash
# for a workstation
ansible-playbook -i localhost, -c local workstation.yaml -K

# for a server
ansible-playbook -i localhost, -c local server.yaml -K
```

## Direct run

To set up the local machine with only one command use the following:

```bash
# for a workstation
curl -fsSL https://fedora.fjelloverflow.dev/setup-workstation.sh | bash

# for a workstation
curl -fsSL https://fedora.fjelloverflow.dev/setup-server.sh | bash
```

The scripts automatically install the dependencies, clone the repository, run the playbook and clean up afterwards, all in one single command.