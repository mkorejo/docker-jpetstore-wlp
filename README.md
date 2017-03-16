## docker-jpetstore-wlp

This is essentially a fork of [MyBatis JPetStore](https://github.com/mybatis/jpetstore-6) but the application is shipped as a Docker image and runs on [WebSphere Liberty](https://hub.docker.com/_/websphere-liberty/). The unpackaged source code is provided for reference. The Docker image builds using the WAR file.

#### Build the image
```
git clone https://github.com/mkorejo/docker-jpetstore-wlp.git
docker build -t <registry>/<namespace>/jpetstore-wlp:<tag> [-t <registry>/<namespace>/jpetstore-wlp:latest] .
```

#### Database requirements
The application looks for a MySQL DB named *jpetstore* on port 3306 with the proper initialization, as defined in `jpetstore-src/WEB-INF/classes/properties/database.properties`.

By default, the database host is configured as `172.17.0.1` which is the typical IP for `docker0`, the Docker bridge interface. You can override this at runtime using `-e DB_HOST=<alt_db_host>`.

You can use the official MySQL image on Docker Hub and initialize the DB with the SQL in `jpetstore-db/` like this:
```
docker run -e MYSQL_ROOT_PASSWORD=password -d -v /path/on/dockerhost/jpetstore-db:/docker-entrypoint-initdb.d:ro -p 3306:3306 mysql:5.6
```

#### Run the image
```
docker run -d -p 9080:9080 [-e DB_HOST=<alt_db_host>] <registry>/<namespace>/jpetstore-wlp:<tag>
```

#### Run the application with the WebSphere Liberty image
```
docker run -d -p 9080:9080 -v /path/on/dockerhost/JPetStore.war:/config/dropins/JPetStore.war websphere-liberty
```
