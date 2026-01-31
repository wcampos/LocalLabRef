# Contributing

Thanks for your interest in LocalLabRef. This repo is a reference collection of infrastructure patterns for home labs. Contributions are welcome.

## How to contribute

- **Issues** – Bug reports, questions, or suggestions for new stacks or improvements
- **Pull requests** – Fixes, docs updates, new Ansible roles, Docker stacks, or K8s manifests

## Guidelines

1. **Keep it generic** – No secrets, credentials, or environment-specific data. Use placeholders (e.g. `YOUR_ACME_EMAIL@example.com`, `change-me`) and `.example` files where needed.

2. **Stay consistent** – Follow existing patterns (labels, structure, README format). See `kubernetes/apps/` and `stacks/` for examples.

3. **Document** – Add or update READMEs with product descriptions, references, and deploy/access instructions.

4. **Test** – If possible, verify Ansible playbooks, Docker Compose files, or Kustomize builds before submitting.

## Scope

- Ansible roles and playbooks for Ubuntu/Debian
- Docker Compose stacks
- Raw Kubernetes manifests and Kustomize (no Helm charts in this repo)
- Argo CD applications
- Documentation and examples

## Getting started

1. Fork the repo
2. Create a branch (`git checkout -b feature/my-change`)
3. Commit with clear messages (`git commit -m "Add X to Y"`)
4. Push and open a pull request
