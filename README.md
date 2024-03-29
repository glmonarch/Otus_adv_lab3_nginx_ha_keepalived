### Описание стенда

Данный стенд демонстрирует технологию построения отказоустойчивого кластера Wordpress. В данной схеме отказоустойчивым является только фронтэнд т.к. цель лабораторной работы - отработать реализацию протокола VRRP с помощью демона Keepalived. Бэкэнд с базой данных содержится в единственном экземпляре. Стенд тестировался на Mac OS 10.15.7 со следующим установленным ПО:

1. VirtualBox 6.1.18 r142142 (Qt5.6.3)
2. Vagrant 2.2.14
3. Ansible 2.10.5
4. Python 2.7.16

После развертывания стенда будут созданы 3 ВМ:

1. **db1 [10.0.0.13]** - бэкэнд. ВМ Centos 7 с MySQL на борту для хранения базы данных Wordpress.
2. **node1 [192.168.100.11, 10.0.0.11]** - фронтэнд-1. ВМ Centos 7 с Nginx, php-fpm и keepalived. 
3. **node2 [192.168.100.12, 10.0.0.12]** - фронтэнд-2. ВМ Centos 7 с Nginx, php-fpm и keepalived.

Между машинами node1 и node2 подвешен плавающий VRRP_IP 192.168.100.100 По умолчанию VRRP_IP 192.168.100.100 висит на машине node1.


***Цель лабораторной работы: продемонстрировать доступность сайта Wordpress с хост-машины по адресу http://192.168.100.100 после того как машина node1 станет недоступна.***



Сети 192.168.100.0/24 и 10.0.0.0/24, созданные в рамках VirtualBox являются "private_network" и доступны с хост-машины на которой разворачивается стенд. Каждая машина создается с RAM 512Gb на борту.

### Как поднять стенд?

1. **git clone** https://github.com/glmonarch/Otus_adv_lab3_nginx_ha_keepalived.git
2. **cd Otus_adv_lab3_nginx_ha_keepalived**
3. **vagrant up db1 node1 node2**

### Как проверить отказоустойчивость?
1. Зайти с хост-машины через браузер по адресу http://192.168.100.100
2. Заполнить 4 поля начальной регистрации Wordpress и нажать внизу кнопку "Install Wordpress"
3. Зайти в панель управления Wordpress
4. Подключиться по ssh к node1: **vagrant ssh node1** и, например, выключить эту ВМ: **shutdown -h now**
5. Обновить страницу http://192.168.100.100 на хост-машине и убедиться, что Wordpress по прежнему доступен.   


