# Define the environment
FROM ubuntu

EXPOSE 80/tcp
EXPOSE 3306/tcp
EXPOSE 9000/tcp

RUN mkdir /app
COPY . /app

RUN apt-get update

RUN \
	echo "mysql-server-5.7 mysql-server/root_password password root" | debconf-set-selections && \
	echo "mysql-server-5.7 mysql-server/root_password_again password root" | debconf-set-selections && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server && \
	sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mysql.conf.d/mysqld.cnf && \
	mkdir /var/run/mysqld && \
	chown -R mysql:mysql /var/run/mysqld

RUN apt-get install -y curl scala unzip zip apache2 npm nano

RUN rm -R /var/www/html

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

RUN \
	curl -L -o sbt-1.3.8.deb https://dl.bintray.com/sbt/debian/sbt-1.3.8.deb && \
	dpkg -i sbt-1.3.8.deb && \
	rm sbt-1.3.8.deb && \
	apt-get update && \
	apt-get install sbt && \
	sbt sbtVersion
	
CMD	\
	service apache2 start && \
	service mysql start && \
	mysql -u root -proot -e 'USE mysql; UPDATE user SET Host="%" WHERE User="root" AND Host="localhost"; DELETE FROM user WHERE Host != "%" AND User="root"; FLUSH PRIVILEGES;' && \
	cd /app/public/hello-world && \	
	npm run build && \
	ln -s /app/public/hello-world/dist /var/www/html && \
	cd /app && \
	sbt run

# https://github.com/playframework/play-samples/tree/2.8.x/play-scala-rest-api-example