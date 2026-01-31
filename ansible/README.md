# Ansible

Official directory layout for infrastructure automation.

> **Note:** These playbooks and roles are examples of a local setup for my home lab. They use Ansible to deploy and configure an Ubuntu server host—installing Docker, Kubernetes tooling (MicroK8s, kubectl), and optional services like Ollama. Adapt the inventory and variables for your own environment.

## Structure

```
ansible/
├── ansible.cfg           # Ansible configuration
├── inventory/
│   ├── hosts.yml         # Inventory (YAML)
│   └── group_vars/
│       └── all/
│           └── vars.yml  # Group variables
├── playbooks/
│   ├── site.yml          # Main playbook
│   └── mount-volumes.yml # Optional volume mounts
├── roles/
│   ├── common/           # Base packages (python, pip, git)
│   ├── docker/           # Docker CE
│   ├── kubectl/          # kubectl CLI
│   ├── microk8s/         # MicroK8s
│   ├── ollama/           # Ollama LLM
│   └── mount_volumes/    # LVM volume mounts
├── requirements.yml      # Galaxy collections
├── Makefile
└── README.md
```

## Quick Start

```bash
ansible-galaxy install -r requirements.yml
make run
```

## Roles

| Role | Description |
|------|-------------|
| common | Base packages (python3, pip, git, pipx) |
| docker | Docker CE, compose plugin |
| kubectl | kubectl binary |
| microk8s | MicroK8s via snap (dns, storage, ingress) |
| ollama | Ollama LLM server |
| mount_volumes | Mount /data, /artifacts, /runners (optional) |

## Customize

- **inventory/hosts.yml** – Add hosts, groups
- **inventory/group_vars/all/vars.yml** – Set data_uuid, etc. for mount_volumes
- **ansible.cfg** – remote_user, become settings

## Run Specific Roles

```bash
ansible-playbook playbooks/site.yml --tags docker,kubectl
```

## Mount Volumes (Optional)

1. Set `data_uuid`, `artifacts_uuid`, `runners_uuid` in `inventory/group_vars/all/vars.yml`
2. Run: `ansible-playbook playbooks/mount-volumes.yml`
