FROM java:8

MAINTAINER Ed Sweeney <ed@onextent.com>

EXPOSE 8080
COPY target/scala-2.10/*.jar /app/
WORKDIR /app

CMD exec java -cp /app/KafkaOffsetMonitor-assembly-0.3.0-SNAPSHOT.jar -Xms500m -Xmx500m com.quantifind.kafka.offsetapp.OffsetGetterWeb --port 8080 --offsetStorage kafka --zk ${ZK_HOSTS} --refresh 10.seconds --retain 2.days

