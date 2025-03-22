# Роль для обновления пакета sudo на linux серверах.

Обновить пакет sudo потребовалось после обнаружения уязвимости в пакете sudo: 
[CVE-2021-3156: Heap-Based Buffer Overflow in Sudo (Baron Samedit)](https://blog.qualys.com/vulnerabilities-research/2021/01/26/cve-2021-3156-heap-based-buffer-overflow-in-sudo-baron-samedit).

Информационно полезная статья про обновление пакета sudo на linux серверах: [How to update sudo version on Linux](https://www.xmodulo.com/update-sudo-version-linux.html).

## Пример использования.
### Клонируется репозиторий роли.
```
[user@centos homedir]$ mkdir roles
[user@centos homedir]$ cd roles
[user@centos roles]$ git clone -c http.sslVerify=false https://vm-gitlab01.tcsbank.ru/infra-compute/update_packages/update_packages_sudo.git
[user@centos roles]$ cd ..
[user@centos homedir]$
```

### Создаётя файл-плейбук для запуска роли.
```
[user@centos homedir]$ vim update_packages_sudo.yml
[user@centos homedir]$ cat update_packages_sudo.yml
---
- hosts: all
  become: yes
  module_defaults:
    apt:
      force_apt_get: yes
  roles:
    - role: update_packages_sudo
...
[user@centos homedir]$
```

### Создаётся файл списка хостов к которым будет применена роль.
```
[user@centos homedir]$ vim list_of_hosts
[user@centos homedir]$ cat list_of_hosts
[all]
host1
host2

[user@centos homedir]$
```

### Запускается тестирование применения роли с опцией --check и контролируется результат.
```
[user@centos homedir]$ ansible-playbook update_packages_sudo.yml -i list_of_hosts --become --extra-vars "ansible_user=user1" --ask-pass --ask-become-pass --check
SSH password: 
BECOME password[defaults to SSH password]: 

PLAY [all] ***********************************************************************************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************************************************************************
ok: [host1]
ok: [host2]

...

[user@centos homedir]$
```

### Запускается применение роли без опции --check и контролируется результат.
```
[user@centos homedir]$ ansible-playbook update_packages_sudo.yml -i list_of_hosts --become --extra-vars "ansible_user=user1" --ask-pass --ask-become-pass
```
