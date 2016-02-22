import mysqlDB
import milestones
from datetime import datetime
from flask import Flask, render_template, json, request, redirect, session
from flask.ext.mysql import MySQL

app = Flask(__name__) 
app.secret_key = 'my secret key'
mysql = MySQL()

app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'researchAAT'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'

@app.route("/showMile")
def showMile():
    return render_template('showMile.html')

@app.route("/getMile", methods=['GET'])
def getMile():
    results = milestones.mile2() #ignore comments until break!!!!
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
        return json.dumps(returnString)
    else:
        results = mysqlDB.returnAllContent()
        return json.dumps(str(results))

@app.route("/")
def main():
    return render_template('quizMain.html')


@app.before_first_request
def _run_on_start():
    mysqlDB.setupDB() 

if __name__ == "__main__":
    app.debug = True
    app.run(host='0.0.0.0')