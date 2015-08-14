% etcd docker : service discovery
% Fabrice Le Coz
% August, 2015

# etcd

etcd is an open-source distributed key value store that provides shared configuration and service discovery. ( cf https://coreos.com/etcd )

This container will run etcd in a docker. The etcd service is only accessible to the docker running on the same host.

To keep configuration on etcd remove, it's useful to store the database on the host file-system.

to run the docker :

    docker run -it --rm \
        --name etcd \
        -v ${pwd}/data:/data \
        etcd:v2.1.1

> __Nota :__ change the shared directory
    
to request the etcd service :

Write a key :

    docker exec -it etcd etcdctl set mykey "This is awesome"

Read a key :

    docker exec -it etcd etcdctl get mykey

to facilitate the administration, you could create an alias :

    alias etcdctl="docker exec -it etcd etcdctl"

then, simply type :

    etcdctl ls --recursive



