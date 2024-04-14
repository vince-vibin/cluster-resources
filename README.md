# Ansible Cluster Rssources

[![ansible-lint](https://github.com/vince-vibin/cluster-resources/actions/workflows/ansible-lint.yml/badge.svg)](https://github.com/vince-vibin/cluster-resources/actions/workflows/ansible-lint.yml)

## Setup

First add your hosts to the inventory file in /inventory/cluster.yaml

### Using Ansible Vault

Create a vault.yaml in the base directory. The Vault file should look something like this:

```yaml
swarm_token: <SWARM TOKEN>

joplin:
    pg:
        db: <DATABASE NAME>
        password: <DATABASE PASSWORD>
        user: <DATABASE USER>
        port: <DATABASE PORT>
    app:
        url: <JOPLIN URL>
        base_url: <JOPLIN BASE URL>
        port: <JOPLIN PORT>
    nginx:
        port: <NGINX PORT>
```
