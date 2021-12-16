# docker_tasks
основано на https://github.com/anton-teshev/docker_homework
## 1 Лекция
### задание
Написать Dockerfile для frontend располагается в директории /frontend, собрать и запустить
### решение
используя Dockerfile в каталоге task1/frontend собрать контейнер фронтенда, запустить
```
docker build -t "frontend" .
docker run frontend -p 3000:3000 frontend
```
## 2 Лекция
### задание
Написать Dockerfile для backend который располагается в директории /lib_catalog(для сборки контейнера необходимо использовать файл /lib_catalog/requirements.txt), для работы backend необходим postgresql, т.е. необходимо собрать 2 контейнера:
1. backend
2. postgresql

Осуществить сетевые настройки, для работы связки backend и postgresql
### решение
- создать сеть (опционально) `docker network create testapp`
- используя Dockerfile в каталоге task2 собрать котейнер базы данных `docker build -t my_db .`
- используя Dockerfile в каталоге task2\lib_catalog собрать контейнер бэкенда `docker build -t backend .`
- запустить в созданной сети типа bridge контейнер БД, контейнер бэкенда
- запустить сервер django **backend:8000** в контейнере бэкенда
```
docker run --network testapp --network-alias database -dt -v /myvol:/var/lib/postgresql/data my_db
docker run --network testapp --network-alias backend -dt -p 8000:8000 backend
docker exec 8a89a039279e python manage.py runserver backend:8000
``` 


## 3 Лекция
### задание
Написать docker-compose.yaml, для всего проекта, собрать и запустить

## Критерий оценки финального задания
1. Dockerfile должны быть написаны согласно пройденным best practices
2. Для docker-compose необходимо использовать локальное image registry
3. В docker-compose необходимо сетевые настройки 2 разных интерфейса(bridge), 1 - для фронта, 2 - для бека с postgresql

4.* Осуществить сборку проекта самим docker-compose команда docker-compose build(при использовании этого подхода необходимо исключить 2 пункт из критерии оценки)
### решение
используя docker-compose.yml в каталоге task3 собрать и запустить 
```
docker-compose build
docker-compose up
```
или `docker-compose up --build`

- сеть одна, т.к. приложение по замыслу автора работает через localhost
- разнести по разным сетям (backend frontend) - в статусе **TODO**

