import mysqlDB
import milestones
from datetime import datetime
from flask import Flask, render_template, json, request, redirect, session
from flask.ext.mysql import MySQL

app = Flask(__name__) 
app.secret_key = 'my secret key'
mysql = MySQL()

app.config['MYSQL_DATABASE_USER'] = 'aat'
app.config['MYSQL_DATABASE_PASSWORD'] = 'aat'
app.config['MYSQL_DATABASE_DB'] = 'research'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'

@app.route("/showMile")
def showMile():
    return render_template('showMile.html')

@app.route("/getMile", methods=['GET'])
def getMile():
    results = milestones.mile1()
    return json.dumps(results)

@app.route("/showDB")
def showDB():
    return render_template('showDB.html')
    
@app.route('/DB', methods=['GET', 'POST'])
def DB():
    if request.method == 'POST':
        content = request.form['content']
        userid = request.form['userid']
        ip = request.form['ip']
        time = str(datetime.now()) # or use from time import strftime >>>strftime("%Y-%m-%d %H:%M:%S") gives '2009-01-05 22:14:39'

        mysqlDB.addRow(userid, ip, content, time)

        returnString = "Your code has been successfully submitted. Thank you."
        returnString += "\nIP: %s\n UserID: %s\n Content: %s" % (ip,userid,content)
        return json.dumps(returnString)
    else:
        results = mysqlDB.returnAllContent
        return json.dumps(results)

@app.route("/")
def main():
    return render_template('quizMain.html')

if __name__ == "__main__":
    app.debug = True
    app.run(host='0.0.0.0')  