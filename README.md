# README

### On your OS

Update the files of your *apache-tomcat/conf* folder with the files in the *toUpdate* directory.<br/>

You need also to run the script sql in the *script* folder into your DBMS terminal.(Here we are using *MySql*, it might
not work if your using an another one)<br/>

Start *Tomcat* server through *IntelliJ*

### In docker

You will be able to start the *GUERIN.war* file into a docker container following this readme:

Start the docker terminal in this directory

Create a container for the *.war*:
<br/>`docker create --rm --name remote-tomcat -p 8443:8443 tomcat:9.0.12-jre11-slim`<br/>

Execute the following commands which will copy the *.war* and several *Tomcat* configurations files:

<br/>`docker cp out/artifacts/GUERIN_war/GUERIN.war remote-tomcat:/usr/local/tomcat/webapps/GUERIN.war`<br/>
<br/>`docker cp afterToUpdate/context.xml remote-tomcat:/usr/local/tomcat/conf/context.xml`<br/>
<br/>`docker cp afterToUpdate/key remote-tomcat:/usr/local/tomcat/conf/key`<br/>
<br/>`docker cp afterToUpdate/server.xml remote-tomcat:/usr/local/tomcat/conf/server.xml`<br/>


You can now start the container:

<br/>`docker start remote-tomcat`<br/>


You can go now to your web browser and type :<br/>

https://localhost:8443/GUERIN/ (if you use Docker)<br/>
https://192.168.99.100:8443/GUERIN/ (if you use Docker Toolbox)

(All the connections to a DBMS might not work if you don't have a container holding a DBMS)