
Параметры запроса
[редактировать критичность]
Номер   611726
Название    №611726
Приоритет   Средний
Класс обслуживания  9x5
Дата и время обращения  03.11.2015 18:47
Дата регистрации    03.11.2015 18:47
Тип запроса Запрос на обслуживание
Категория
Критичность 1 - Низкая
Срочность   Низкая
Описание запроса
Здравствуйте, коллеги!

Требуется УЗ для меня на серверах:
enr-bl2.datamind.ru
dsp[1-6].datamind.ru

Предварительно нужно проверить, что сервера находятся в ЗО DWH.

С уважением,

Георгий Безруких
Системный администратор

................................................................................

Комментарии
[добавить комментарий]
Дата
Комментарий Автор
05.11.2015 12:49    Учётная запись g.bezrukikh на сервере enr-bl2.datamind.ru создана.

uid=5101(g.bezrukikh) gid=5101(g.bezrukikh) groups=5101(g.bezrukikh),27(sudo)

Хэш пароля использован с сервера mongodb1.datamind.ru.
Белогруд Сергей В
05.11.2015 11:41
From: Bezrukikh Georgiy Gennadyevich
Sent: Thursday, November 05, 2015 10:39 AM
To: Gurkin Roman Vladimirovich; Belogrud Sergey Vladimirovich
Cc: Chernyh Aleksandr Vladimirovich
Subject: RE: УЗ на серверах в hezner

Забыл, что сервера не в нашей ЗО, поэтому запросил. Добавил информацию в SD. Доступ нужен только к enr-bl2


Георгий Безруких
Системный администратор
Белогруд Сергей В
04.11.2015 14:19    Точно, уже обсуждали, что dsp не в нашей ЗО. Соответственно, нужен нужен доступ только к enr-bl2    Безруких Георгий
03.11.2015 19:19
From: Gurkin Roman Vladimirovich
Sent: Tuesday, November 03, 2015 7:09 PM
To: Belogrud Sergey Vladimirovich
Cc: Chernyh Aleksandr Vladimirovich; Bezrukikh Georgiy Gennadyevich
Subject: RE: УЗ на серверах в hezner

Сергей привет

Сервера админит Саша Черных
Георгий зачем нужен доступ?

-Роман

From: Belogrud Sergey Vladimirovich
Sent: Tuesday, November 03, 2015 7:07 PM
To: Gurkin Roman Vladimirovich
Cc: Chernyh Aleksandr Vladimirovich; Bezrukikh Georgiy Gennadyevich
Subject: RE: УЗ на серверах в hezner

Добрый вечер Роман.

По моей информации серверы
148.251.1.143 dsp1.datamind.ru
148.251.1.142 dsp2.datamind.ru
148.251.1.141 dsp3.datamind.ru
148.251.1.140 dsp4.datamind.ru
148.251.1.134 dsp5.datamind.ru
148.251.1.133 dsp6.datamind.ru
в Вашей зоне ответственности.

Поэтому уточняю у Вас возможность создания учётной записи для Безруких Георгия на этих серверах.

Подобная тема уже возникала относительно недавно:
Параметры запроса
Номер   571464
Название    №571464
Приоритет   Средний
Класс обслуживания  9x5 (Старая версия)

Дата и время обращения  24.09.2015 12:36
Дата регистрации    24.09.2015 12:36
Тип запроса Запрос на обслуживание
Категория
Критичность 1 - Низкая
Срочность   Низкая
Описание запроса
Добрый день, коллеги!

Требуется завести для меня УЗ на серверах:
dsp1.datamind.ru
dsp2.datamind.ru
dsp3.datamind.ru
dsp4.datamind.ru
dsp5.datamind.ru
dsp6.datamind.ru
gr1.datamind.ru
ui1.datamind.ru
ui2.datamind.ru

По аналогии с <mongodb1.datamind.ru>.

С уважением,

Георгий Безруких
Системный администратор



И закончилось всё впустую потраченным временем.

Дата
Комментарий Автор

25.09.2015 16:04    Созданная ранее учётная запись g.bezrukikh залочена на перечисленных серверах.  Белогруд Сергей В

25.09.2015 11:37    На уточнении.   Белогруд Сергей В

25.09.2015 10:26    Коллеги, владелец серверов

dsp1.datamind.ru
dsp2.datamind.ru
dsp3.datamind.ru
dsp4.datamind.ru
dsp5.datamind.ru
dsp6.datamind.ru
gr1.datamind.ru
ui1.datamind.ru
ui2.datamind.ru

Рома Гуркин и он говорит, что не согласовывал предоставление таковых, просьба убрать доступы и удалить пользователя Черных Александр

24.09.2015 18:14    Доступы есть. Спасибо.
Сделайте еще для сервера gr2.datamind.ru.   Безруких Георгий

24.09.2015 16:11    Вернуть автору для проверки.    Белогруд Сергей В

24.09.2015 16:10    Учётная запись заведена.
Нужно проверить.    Белогруд Сергей В

................................................................................

bsv@bk1:~$ read -s SSHPASS ; export SSHPASS
bsv@bk1:~$ for var1 in enr-bl2.datamind.ru ; do sshpass -e ssh -t -oStrictHostKeyChecking=no -oPubkeyAuthentication=no bsv@${var1} "( sudo -i sh -c $' hostname ; groupadd -g 5101 g.bezrukikh ; useradd -u 5101 -g g.bezrukikh -G sudo -c \'g.bezrukikh@tinkoff.ru SD611726\' -m -s /bin/bash -p \'\$6\$BkviyseJ\$6HKQxvUAP5pqYSrqO66OWpoFqmhnaU5Ndpwds90d55zFWZHfen3nQAJMqHrEQhDAhOsIciZIaImrE82Zwd6Hy/\' g.bezrukikh ' ; id g.bezrukikh )" ; done
Warning: Permanently added 'enr-bl2.datamind.ru,144.76.224.112' (ECDSA) to the list of known hosts.
[sudo] password for bsv:
enr-bl2.datamind.ru
uid=5101(g.bezrukikh) gid=5101(g.bezrukikh) groups=5101(g.bezrukikh),27(sudo)
Connection to enr-bl2.datamind.ru closed.
bsv@bk1:~$

bsv@bk1:~$ for var1 in enr-bl2.datamind.ru ; do sshpass -e ssh -t -oStrictHostKeyChecking=no -oPubkeyAuthentication=no bsv@${var1} "( sudo -i sh -c $' hostname ; id g.bezrukikh ; sudo -l -U g.bezrukikh' )" ; done
[sudo] password for bsv:
enr-bl2.datamind.ru
uid=5101(g.bezrukikh) gid=5101(g.bezrukikh) groups=5101(g.bezrukikh),27(sudo)
Matching Defaults entries for g.bezrukikh on this host:
    env_reset, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin

User g.bezrukikh may run the following commands on this host:
    (ALL : ALL) ALL
Connection to enr-bl2.datamind.ru closed.
bsv@bk1:~$


