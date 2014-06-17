DBMS Project 2
===

This project is a toy police system for for the course
[Introduction to Database System](http://www.cs.nthu.edu.tw/~yishin/Courses/CS4710/2014_index.html)
offered by [Yi-Shin Chen](http://www.cs.nthu.edu.tw/~yishin/C_index.html).

##Contributors

- 9962203 / 張馨尹
- 9962210 / 徐丞裕
- 9962211 / 李昀叡
- 9962230 / 江彥勳
- 9962231 / 陳盟仁
- 9962319 / 呂佳鴻

(sorted by student ID)

##Running the Program
This project utilized [Node.js](http://nodejs.org/)
and [Express.js](http://expressjs.com/) as its server.

You may start the server by the following steps:
  1. Install the [Node.js](http://nodejs.org/) framework
  2. Go to the `Server` directory and execute the following commands in a command line prompt:
  ```shell
  $ npm install
  $ npm start
  ```
  and you will get this if the server is running:
  ```shell
  > dbms-p2@0.0.1 start /PATH/TO/Server
  > node server.js

  Listening on port 8080
  ```


After starting the server, you may go to
```
http://127.0.0.1:8080/
```
to access the app.

##Known Issues
- Can't execute the `Incident` part
if you choose `Stolen/Robbed` as the type.
- No `classmates` will be inserted in the `Criminal` part.

##Contact
Please contact [ChengYu Hsu](mailto:cyhsu@netdb.cs.nthu.edu.tw)
for any issue.
