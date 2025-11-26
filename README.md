<h1 align="center">
  Ansible Fedora Setup
</h1>

<p align="center">
  Straightforward ansible playbooks that set up a fresh Fedora install.
</p>

<p align="center">
  <img src="https://img.shields.io/github/v/tag/FjellOverflow/ansible-fedora-setup?label=Version"/>
  &ensp;
  <img src="https://img.shields.io/github/license/FjellOverflow/ansible-fedora-setup?label=License"/>
  &ensp;
  <img src="https://img.shields.io/github/actions/workflow/status/FjellOverflow/ansible-fedora-setup/lint.yaml?branch=main&label=CI"/>
</p>

<p align="center">
  <a href="#usage">Usage</a> |
  <a href="#development">Development</a>
</p>

A straightforward ansible playbook that sets up a fresh Fedora (Workstation & Server edition, >= 42) install. Adds & removes packages, sets up shell, tweaks GNOME & more.

## Usage

> [!WARNING]  
> Never blindly run scripts from the web, including this playbook. Make sure you understand its content.

### Direct

Without any extra steps, run the following commands to set up the local machine directly.

```bash
# for a workstation
curl -fsSL https://fedora.fjelloverflow.dev/setup/workstation | bash

# for a server
curl -fsSL https://fedora.fjelloverflow.dev/setup/server | bash
```

### Local

To run the playbook with ansible on your local machine, use the following steps.

1. Install `ansible`

```bash
sudo dnf install -y ansible
```

2. Clone this repository

```bash
git clone https://github.com/FjellOverflow/ansible-fedora-setup.git && cd ansible-fedora-setup
```


3. Run the playbook

> [!WARNING]  
> Note the comma: `localhost,`

```bash
# for a workstation
ansible-playbook -i localhost, -c local playbooks/workstation.yaml -K

# for a server
ansible-playbook -i localhost, -c local playbooks/server.yaml -K
```

### Remote

To set up a remote machine, by running the playbook through ssh, follow these steps.

1. Install `ansible`

```bash
sudo dnf install -y ansible
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

```bash
# for a workstation
ansible-playbook playbooks/workstation.yaml -K

# for a server
ansible-playbook playbooks/server.yaml -K
```

## Development

To develop this project within VS Code:

- Install [ansible-dev-tools](https://github.com/ansible/ansible-dev-tools)
- Install the [Ansible extension](https://marketplace.visualstudio.com/items?itemName=redhat.ansible) in VS Code.
- In VS Code, search for `ansible validation` in the settings, and enable both *Ansible validation* and *Ansible validation lint*. Also type `ansible-lint` in the path for *ansible-lint*.

Now all ansible files should get linted on every save. Alternatively, you can run `ansible-lint --fix` on the command line to get a linter report on all project files.
