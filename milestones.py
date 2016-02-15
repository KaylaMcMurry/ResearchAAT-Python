import mysqlDB

def mile1():
    #first milestone
    id = 1
    metric = "def main exists"
    query = 'def&nbsp;main'
    mysqlDB.queryContent(query,id,metric)

    #second milestone
    id = 2
    metric = "left_standing defined"
    query = 'def&nbsp;left_standing.*?(\().*?((?:[a-z][a-z]+)).*?,.*?((?:[a-z][a-z]+)).*?(\))'
    mysqlDB.queryContent(query,id,metric)

    #third milestone
    id = 3
    metric = "left_standing called first time"
    query = []
    query[0] = 'def&nbsp;left_standing.*?main.*?left_standing' #find left_standing in main after def left_standing
    query[1] = 'main.*?left_standing.*?def&nbsp;left_standing' #find any left_standing in main before def left_standing
    query[2] = 'main.*?left_standing' #make sure is last option - no def left_standing
    mysqlDB.mulipleQueries(query, len(query), id, metric)

    # #fourth milestone
    id = 4
    metric = "left_standing called second time"
    query = []
    query[0] = 'def&nbsp;left_standing.*?main.*?left_standing.*?left_standing'
    query[1] = 'main.*?left_standing.*?left_standing.*?def&nbsp;left_standing'
    query[2] = 'main.*?left_standing.*?left_standing'
    mysqlDB.mulipleQueries(query, len(query), id, metric)

    #fifth milestone
    id = 5
    metric = "input requested from user"
    query = 'input'
    mysqlDB.queryContent(query,id,metric)
    

    #sixth milestone
    id = 6
    metric = "print result"
    query = []
    query[0] = 'print&nbsp;(\().*?"Total.*?(\))'
    query[1] = 'print(\().*?"Total.*?(\))'
    mysqlDB.mulipleQueries(query, len(query), id, metric)

    #seventh milestone
    id = 7
    metric = "begin body of left_standing function"
    query = []
    query[0] = 'def&nbsp;left_standing.*?(\().*?((?:[a-z][a-z]+)).*?,.*?((?:[a-z][a-z]+)).*?(\)).*?:<br/>&nbsp;&nbsp;&nbsp;&nbsp;((?:[a-z][a-z]+)).*?<br/>.*?main' #def left before main
    query[1] = 'main.*?def&nbsp;left_standing.*?(\().*?((?:[a-z][a-z]+)).*?,.*?((?:[a-z][a-z]+)).*?(\)).*?:<br/>&nbsp;&nbsp;&nbsp;&nbsp;((?:[a-z][a-z]+))' #def left after main

    query[2] = 'def&nbsp;left_standing.*?(\().*?((?:[a-z][a-z]+)).*?,.*?((?:[a-z][a-z]+)).*?(\)).*?:<br/>&nbsp;&nbsp;&nbsp;&nbsp;((?:[a-z][a-z]+))' #no main
    mysqlDB.mulipleQueries(query, len(query), id, metric)

    results = mysqlDB.printMilestones()
    return results





def mile2():
    #first milestone
    id = 1
    metric = "input for game/scrimage"
    query = 'input.*?(\().*?Enter&nbsp;g.*?Game.*?s.*?(\)).*?'
    mysqlDB.queryContent(query,id,metric)

    #second milestone
    id = 2
    metric = "input for # players"
    query = 'input.*?(\().*?(How&nbsp;many&nbsp;players).*?(\)).*?'
    mysqlDB.queryContent(query,id,metric)

    #third milestone
    id = 3
    metric = "if statement for game/scrimage"
    query = 'if.*?(\:)'
    mysqlDB.queryContent(query,id,metric)


    #fourth milestone
    id = 4
    metric = "loop present"
    query = []
    query[0] = 'while'
    query[1] = 'for'
    mysqlDB.mulipleQueries(query, len(query), id, metric)
        

    #fifth milestone
    id = 5
    metric = "loop nested within if statement"
    query = []
    query[0] = 'if.*?:.*?for'
    query[1] = 'if.*?:.*?while'
    mysqlDB.mulipleQueries(query, len(query), id, metric)

    #sixth milestone
    id = 6
    metric = "input for individual players"
    query = 'input.*?(\().*?Player.*?(\#).*?(\:).*?(\))'
    mysqlDB.queryContent(query,id,metric)

    #seventh milestone
    id = 7
    metric = "else or elif"
    query = []
    query[0] = 'else'
    query[1] = 'elif'
    mysqlDB.mulipleQueries(query, len(query), id, metric)

    #eigth milestone
    id = 8
    metric = "input for our team"
    query = 'input.*?(\().*?Our&nbsp;team.*?(\))'
    mysqlDB.queryContent(query,id,metric)

    #ninth milestone
    id = 9
    metric = "input for our team within else/elif"
    query = []
    query[0] = 'else.*?input.*?(\().*?Our&nbsp;team.*?(\))'
    query[1] = 'elif.*?input.*?(\().*?Our&nbsp;team.*?(\))'
    mysqlDB.mulipleQueries(query, len(query), id, metric)

    #tenth milestone
    id = 10
    metric = "input for other team"
    query = 'input.*?(\().*?Other&nbsp;team.*?(\))'
    mysqlDB.queryContent(query,id,metric)

    #eleventh milestone
    id = 11
    metric = "print for our team"
    query = 'print.*?(\().*?Our&nbsp;team.*?(\))'
    mysqlDB.queryContent(query,id,metric)

    #twelvth milestone
    id = 12
    metric = "print for other team"
    query = 'print.*?(\().*?Other&nbsp;team.*?(\))'
    mysqlDB.queryContent(query,id,metric)


    results = mysqlDB.printMilestones()
    return results