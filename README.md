% etcd docker : service discovery  
% Fabrice Le Coz  
% August, 2015

# etcd

etcd is an open-source distributed key value store that provides shared configuration and service discovery. ( cf https://coreos.com/etcd )

This container will run etcd in a docker. The etcd service is only accessible to the docker running on the same host.

To keep configuration on etcd remove, it's useful to store the database on the host file-system.

> __Nota :__ the version of the docker image will reflect the version of the embedded etcd server.

# Running

> Nota : you can obtain the last builded images from the NAS /exploitation/Docker, to deploy the image on a server ( {{serverName}} ) with docker-machine :
>
>      docker-machine scp /Volumes/exploitation/Docker/etcd-v2.1.1.tar.bz2 {{serverName}}:
>      docker-machine ssh {{serverName}} 'bzip2 -c -d etcd-v2.1.1.tar.bz2 | docker load'
>      docker-machine ssh {{serverName}} rm etcd-v2.1.1.tar.bz2

    docker run -it --rm \
        --name etcd \
        -v /opt/data/etcd:/data \
        etcd:2.1.1

# properties

  - Exposed port : 2379 & 4001
  - Volumes :
    - /data : the database directory
  - link : none

> __Nota :__ As ETCD may contain vital information about your configuration, it is not recommanded to bind the ports to the host public interface.

# Using etcd

to facilitate the administration, you could create an alias :

    alias etcdctl="docker exec -it etcd etcdctl"

get the entries tree :

    etcdctl ls --recursive

Write a key :

    etcdctl set mykey "This is awesome"

Read a key :

    etcdctl get mykey

Remove a key :

    etcdctl rm mykey

For further documentation about etcd, consult [the official website](https://coreos.com/etcd/docs/latest/api.html)
