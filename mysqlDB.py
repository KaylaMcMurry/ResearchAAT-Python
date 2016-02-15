#!/usr/bin/env python
import mysql.connector
import re #regex
import cgitb # Turn on debug mode.


def connection():

        conn = mysql.connector.connect(
        db='research',
        user='aat',
        passwd='aat',
        host='localhost')

        return conn

def setupDB():
    cgitb.enable()

    try:
        conn = connection()
        c = conn.cursor()
        c.execute("START TRANSACTION")

        c.execute("CREATE TABLE IF NOT EXISTS `content` (userid varchar(10) NOT NULL, contentid int(10) NOT NULL AUTO_INCREMENT, ip varchar(20), content text, time varchar(20), PRIMARY KEY(contentid,userid))") 

        c.execute("CREATE TABLE IF NOT EXISTS `metric` (metricid int(3) NOT NULL, userid varchar(10) NOT NULL, metricstring text, ip varchar(20), codecontent text, codetime varchar(20), PRIMARY KEY(metricid,userid))")

        conn.commit()
        c.close()
        conn.close()

    except mysql.connector.Error as err:
        print("Failed creating database: ", err)


def addRow(userid, ip, content, time):
    cgitb.enable()

    try:
        conn = connection()
        c = conn.cursor()
        c.execute("START TRANSACTION")

        addRow = ("""INSERT IGNORE INTO `content`
                    (`userid`, `ip`, `content`, `time`) 
                    VALUES (%s, %s, %s, %s)""")
        dataRow = (userid, ip, content, time)

        c.execute(addRow, dataRow)

        conn.commit()
        c.close()
        conn.close()

    except mysql.connector.Error as err:
        print("Failed adding row: ", err)

    
def returnAllContent():
    cgitb.enable()

    try:
        conn = connection()
        c = conn.cursor()
        results = "" 

        c.execute("SELECT * FROM `content`")
        rows = c.fetchall()

        for each in rows:
            results += each

        c.close()
        conn.close()

    except mysql.connector.Error as err:
        results = "Failed retrieving content: " + err

    return results

def addMile(metricid, userid, metricstring, ip, codecontent, codetime):
    cgitb.enable()

    try:
        conn = connection()
        c = conn.cursor()
        c.execute("START TRANSACTION")

        addRow = ("""INSERT IGNORE INTO `metric`
                    (`metricid`, `userid`, `metricstring`, `ip`, `codecontent`, `codetime`) 
                    VALUES (%d, %s, %s, %s, %s, %s)""")
        dataRow = (metricid, userid, metricstring, ip, codecontent, codetime)

        c.execute(addRow, dataRow)

        conn.commit()
        c.close()
        conn.close()

    except mysql.connector.Error as err:
        print("Failed adding milestone to db: ", err)

def queryContent(query, metricid, metricstring):
    cgitb.enable()
    reg = re.compile(ur'%s' % (query), re.IGNORECASE)

    try:
        conn = connection()
        c = conn.cursor() 

        c.execute("SELECT `userid` from `content` GROUP BY `userid`")
        userids = c.fetchall() #collect all unique userids (return milestones for every userid)

        for row in userids:
            c.execute("SELECT `userid`,`contentid`,`ip`,`content`,`time` from `content` WHERE `userid` = row[0]")
            useridResults = c.fetchall() #return all data from specific userid

            meetRequirements = {}
            for row2 in useridResults:

                content = u"%s" % (str(row2[3]))
                if re.search(reg, content) is not None: #check if milestone regex matches content
                    time = datetime.strptime(row2[4], "%Y-%m-%d %H:%M:%S.%f")
                    meetRequirements[time] = row2 #if meets milestone, save row to dictionary with key being the time 
            
            if meetRequirements: #there are rows saved in my dictionary
                myList = list(meetRequirements.keys())
                first = myList[0]
                for each in myList:
                    if each < first:
                        first = each
                milestone = meetRequirements.get(first)
                mysqlDB.addMile(metricid, milestone[0], metricstring, milestone[2], milestone[3], milestone[4]) #add milestone to db
            else: #no matching metrics for userid so return nulls
                mysqlDB.addMile(metricid, milestone[0], metricstring, milestone[2], "NULL", "NULL") #add missing milestone to db

        c.close()
        conn.close()

    except mysql.connector.Error as err:
        print("Failed to query content: ", err)

def mulipleQueries(querylist, length, metricid, metricstring):
    cgitb.enable()

    i = 1
    flag = false
    while i <= length and not flag:
        reg = re.compile(ur'%s' % (querylist[i]), re.IGNORECASE)
        
        try:
            conn = connection()
            c = conn.cursor() 

            c.execute("SELECT `userid` from `content` GROUP BY `userid`")
            userids = c.fetchall() #collect all unique userids (return milestones for every userid)

            for row in userids:
                c.execute("SELECT `userid`,`contentid`,`ip`,`content`,`time` from `content` WHERE `userid` = row[0]")
                useridResults = c.fetchall() #return all data from specific userid

                meetRequirements = {}
                for row2 in useridResults:

                    content = u"%s" % (str(row2[3]))
                    if re.search(reg, content) is not None: #check if milestone regex matches content
                        time = datetime.strptime(row2[4], "%Y-%m-%d %H:%M:%S.%f")
                        meetRequirements[time] = row2 #if meets milestone, save row to dictionary with key being the time 
                
                if meetRequirements: #there are rows saved in my dictionary
                    myList = list(meetRequirements.keys())
                    first = myList[0]
                    for each in myList:
                        if each < first:
                            first = each
                    milestone = meetRequirements.get(first)
                    mysqlDB.addMile(metricid, milestone[0], metricstring, milestone[2], milestone[3], milestone[4]) #add milestone to db
                    flag = true                    

            c.close()
            conn.close()

        except mysql.connector.Error as err:
            print("Failed to query content: ", err)

        i+=1

    if not flag:
        try:
            mysqlDB.addMile(metricid, milestone[0], metricstring, milestone[2], "NULL", "NULL") #add missing milestone to db
        except mysql.connector.Error as err:
            print("Failed to query content: ", err)

def printMilestones():
    cgitb.enable()

    try:
        conn = connection()
        c = conn.cursor()
        results = "" 

        c.execute("SELECT * FROM `metric` ORDER BY userid, metricid")
        rows = c.fetchall()

        for each in rows: #format results for printing on the screen
            results = "<b>Milestone %s - %s - User ID: %s, IP: %s, Time: %s</b><br/>%s<br/>" % (str(each[0]),str(each[2]),str(each[1]),str(each[3]),str(each[5]),str(each[4]))

        c.close()
        conn.close()

    except mysql.connector.Error as err:
        results = "Failed retrieving milestones: " + err

    return results
