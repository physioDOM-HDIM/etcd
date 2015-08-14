# etcd container : Service discovery

FROM    busybox

MAINTAINER  Fabrice Le Coz <fabrice.lecoz@telecomsante.com>

LABEL version="1.0"
LABEL description="service discovery etcd v2.1.1"

ADD    etcd-v2.1.1-linux-amd64.tar.gz /opt

RUN     ln -sfn /opt/etcd-v2.1.1-linux-amd64/etcd /bin && \
        ln -sfn /opt/etcd-v2.1.1-linux-amd64/etcdctl /bin

COPY    start.sh  .

VOLUME  ["/data"]

EXPOSE  2379 4001

CMD ["./start.sh"]