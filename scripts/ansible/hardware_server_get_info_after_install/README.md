# Роль для сбора информации о настройках ОС и ПО на сервере.

Используется для проверки настроек подготовленного сервера.
Перед отдачей сервера заказчику.
Перед началом промышленного использования сервера.

При успешном выполнении роли в текущем каталоге запуска роли создаётся подкаталог collections.
В подкаталог collections сохраняется текстовый файл.
В файле информация из вывода запущенных на целевом сервере команд.
Команд, вывод которых интересен для проверки.

### Пример формата и содержимого текстового файла.
```
# BEGIN ANSIBLE MANAGED BLOCK --- Get info about hostname 
	shell: 'echo ; hostname'

	ds-prod-search-es-10.tcsbank.ru

# END ANSIBLE MANAGED BLOCK --- Get info about hostname
# BEGIN ANSIBLE MANAGED BLOCK --- Get info about server's chassis
	shell: 'echo ; dmidecode -t system'

	# dmidecode 3.2
	Getting SMBIOS data from sysfs.
	SMBIOS 3.2.0 present.
	
	Handle 0x0100, DMI type 1, 27 bytes
	System Information
		Manufacturer: Dell Inc.
		Product Name: PowerEdge R640
		Version: Not Specified
		Serial Number: 33JP873
		UUID: 4c4c4544-0033-4a10-8050-b3c04f383733
		Wake-up Type: Power Switch
		SKU Number: SKU=0716;ModelName=PowerEdge R640
		Family: PowerEdge
	
	Handle 0x0C00, DMI type 12, 5 bytes
	System Configuration Options
		Option 1: NVRAM_CLR: Clear user settable NVRAM areas and set defaults
		Option 2: PWRD_EN: Close to enable password
	
	Handle 0x2000, DMI type 32, 11 bytes
	System Boot Information
		Status: No errors detected

# END ANSIBLE MANAGED BLOCK --- Get info about server's chassis
...
```

## Пример использования.
### Клонируется репозиторий роли.
```
[user@centos homedir]$ mkdir roles
[user@centos homedir]$ cd roles
[user@centos roles]$ git clone -c http.sslVerify=false https://vm-gitlab01.tcsbank.ru/infra-compute/infrastructure/hardware_server_get_info_after_install.git
[user@centos roles]$ cd ..
[user@centos homedir]$
```

### Создаётя файл-плейбук для запуска роли.
```
[user@centos homedir]$ vim hardware_server_get_info_after_install.yml
[user@centos homedir]$ cat hardware_server_get_info_after_install.yml
---
- hosts: all
  become: yes
  gather_facts: yes
  roles:
    - role: hardware_server_get_info_after_install
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
[user@centos homedir]$ ansible-playbook hardware_server_get_info_after_install.yml -i list_of_hosts --become --extra-vars "ansible_user=user1" --ask-pass --ask-become-pass --check
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
[user@centos homedir]$ ansible-playbook hardware_server_get_info_after_install.yml -i list_of_hosts --become --extra-vars "ansible_user=user1" --ask-pass --ask-become-pass
```

----

#### Возможные трудности
Если при запуске роли появляетя сообщение следующего вида.
```
[support@centos homedir]$ ansible-playbook hardware_server_get_info_after_install.yml -i list_of_hosts --become --extra-vars "ansible_user=user1" --ask-pass --ask-become-pass
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
[support@centos homedir]$ export ANSIBLE_HOST_KEY_CHECKING=False ; ansible-playbook hardware_server_get_info_after_install.yml -i list_of_hosts --become --extra-vars "ansible_user=user1" --ask-pass --ask-become-pass
SSH password:
BECOME password[defaults to SSH password]:

PLAY [all] ***********************************************************************************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************************************************************************
ok: [host1]
```
