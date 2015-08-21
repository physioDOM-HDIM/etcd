# etcd container : Service discovery

FROM    busybox

MAINTAINER  Fabrice Le Coz <fabrice.lecoz@telecomsante.com>

ADD    etcd-v2.1.1-linux-amd64.tar.gz /opt

RUN     ln -sfn /opt/etcd-v2.1.1-linux-amd64/etcd /bin && \
        ln -sfn /opt/etcd-v2.1.1-linux-amd64/etcdctl /bin

COPY    start.sh  .

VOLUME  ["/data"]

EXPOSE  2379 4001

LABEL version="2.1.1"
LABEL description="service discovery etcd v2.1.1"
LABEL buitdate="August, 2015"

CMD ["./start.sh"]
