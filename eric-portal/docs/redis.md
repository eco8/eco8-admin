## docker-redis

1. 安装：`docker pull redis:latest`
2. 查看本地镜像：`docker images`
3. 运行容器：`docker run -itd --name redis-test -p 6379:6379 redis`
    - -p 6379:6379：映射容器服务的 6379 端口到宿主机的 6379 端口，外部可以直接通过宿主机ip:6379 访问到 Redis 的服务。
    - redis-test 为容器命名
5. 进入redis所在doker容器：`docker exec -it redis-test /bin/bash`
4. 连接测试：`redis-cli` 回车，测试命令：`set test 1`，回复 "OK" 即可
