Research-AAT-Python

Installs: mysql, pymysql, python
    mysql.connector, re, cgitb, datetime, flask, flask.ext.mysql

Run:
    1. make sure mysql is running
    2. create database 'research'
    3. set 'research' username and pw and change these in app.py and mysqlDB.py
    4. set host in app.py and mysqlDB.py
    5. turn off debug mode in app.py and remove cgitb in mysqlDB.py 
    6. run "python app.py"
    7. to see milestones -> host:5000/showMile
    8. to see all content -> host:5000/showDB