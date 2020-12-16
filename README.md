# Ubuntu image including Systemd

This [Docker](https://www.docker.com) image can be used to test [Ansible](https://www.ansible.com) playbooks based on [Molecule](https://molecule.readthedocs.io).

## Supported tags

|Branch|Ubuntu version|Docker image tag|
|------|--------------|----------------|
|master|20.04         |20.04           |
|18.04 |18.04         |18.04           |
|20.04 |20.04         |20.04           |

## Usage

### Start the container

```console
docker run \
  --cap-add SYS_ADMIN \
  --detach \
  --name ubuntu-20.04 \
  --rm \
  --volume /sys/fs/cgroup:/sys/fs/cgroup:ro \
  dhoppeit/docker-ubuntu-systemd:20.04
```

### Enter the container

```console
docker exec -it ubuntu-20.04 bash
```

### Stop the container

```console
docker stop ubuntu-20.04
```
