# Роль для настройки доступа linux серверов к репозиториям системных программ.

Роль используется для размещения файлов с настройками доступа к репозиториям на linux серверах.
Файлы с настройками позволяют получать доступ к внешним репозиториям через внутренние прокси-сервисы.
Обычно роль использутеся сразу после установки ОС на настраиваемом hardware сервере.

## Замечания
Роль находится в состоянии разработки.

В ветке source размещены оригиналы файлов настройки доступа к репозиториям. Эти файлы присутствуют в ОС сразу после её установки.

## Описание работы роли
Оригинальные файлы настройки доступа к репозиториям заменяются файлами из шаблона этой роли.
Заменяемые файлы на всякий резервный случай копируются в /tmp.

## Пример использования.
### Клонируется репозиторий роли.
```
[user@centos homedir]$ mkdir roles
[user@centos homedir]$ cd roles
[user@centos roles]$ git clone -c http.sslVerify=false https://vm-gitlab01.tcsbank.ru/infra-compute/repository/repository.git
[user@centos roles]$ cd ..
[user@centos homedir]$
```

### Создаётя файл-плейбук для запуска роли.
```
[user@centos homedir]$ vim repository.yml
[user@centos homedir]$ cat repository.yml
---
- hosts: all
  become: yes
  gather_facts: yes
  roles:
    - role: repository
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
[user@centos homedir]$ ansible-playbook repository.yml -i list_of_hosts --become --extra-vars "ansible_user=user1" --ask-pass --ask-become-pass --check
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
[user@centos homedir]$ ansible-playbook repository.yml -i list_of_hosts --become --extra-vars "ansible_user=user1" --ask-pass --ask-become-pass
```

----

#### Возможные трудности
Если при запуске роли появляетя сообщение следующего вида.
```
[support@centos homedir]$ ansible-playbook repository.yml -i list_of_hosts --become --extra-vars "ansible_user=user1" --ask-pass --ask-become-pass
SSH password:
BECOME password[defaults to SSH password]:

PLAY [all] ***********************************************************************************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************************************************************************
fatal: [host1]: FAILED! => {"msg": "Using a SSH password instead of a key is not possible because Host Key checking is enabled and sshpass does not support this.  Please add this host's fingerprint to your known_hosts file to manage this host."}

PLAY RECAP ***********************************************************************************************************************************************************************************
host1       : ok=0    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0

[support@centos homedir]$
```

То победить это можно определив переменную ANSIBLE_HOST_KEY_CHECKING равной False.
```
[support@centos homedir]$ export ANSIBLE_HOST_KEY_CHECKING=False ; ansible-playbook repository.yml -i list_of_hosts --become --extra-vars "ansible_user=user1" --ask-pass --ask-become-pass
SSH password:
BECOME password[defaults to SSH password]:

PLAY [all] ***********************************************************************************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************************************************************************
ok: [host1]
```
