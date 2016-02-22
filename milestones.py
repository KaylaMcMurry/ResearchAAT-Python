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
    query0 = 'def&nbsp;left_standing.*?main.*?left_standing' #find left_standing in main after def left_standing
    query1 = 'main.*?left_standing.*?def&nbsp;left_standing' #find any left_standing in main before def left_standing
    query2 = 'main^((?!def)).*?left_standing' #make sure is last option - no def left_standing
    query = [query0,query1,query2]
    mysqlDB.mulipleQueries(query, len(query), id, metric)

    # #fourth milestone
    id = 4
    metric = "left_standing called second time"
    query = []
    query0 = 'def&nbsp;left_standing.*?main.*?left_standing.*?left_standing'
    query1 = 'main.*?left_standing.*?left_standing.*?def&nbsp;left_standing'
    query2 = 'main^((?!def)).*?left_standing.*?left_standing'
    query = [query0,query1,query2]
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
    query0 = 'print&nbsp;(\().*?"Total.*?(\))'
    query1 = 'print(\().*?Total.*?(\))'
    query = [query0,query1]
    mysqlDB.mulipleQueries(query, len(query), id, metric)

    #seventh milestone - STILL NEEDS WORK 
    id = 7
    metric = "begin body of left_standing function"
    query = []
    query0 = 'def&nbsp;left_standing.*?:.*?(&nbsp;)*(?!def)(?!br)(?!main)((?:[a-z][a-z]+)).*?main' #def left before main
    query1 = 'main.*?def&nbsp;left_standing.*?:.*?(&nbsp;)*(?!def)(?!main)(?!br)((?:[a-z][a-z]+))' #def left after main
    query2 = 'def&nbsp;left_standing.*?:.*?<br\/>(&nbsp;)*(?!nbsp;)(?!main)(?!def)(?!br)((?:[a-z][a-z]+))' #no main
    query = [query0,query1,query2]
    mysqlDB.mulipleQueries(query, len(query), id, metric)

    results = mysqlDB.printMilestones()
    return results


def mile2():
    #first milestone
    id = 1
    metric = "input for game/scrimage"
    query = 'input(&nbsp;)*(\().*?Enter&nbsp;g.*?Game.*?s.*?(\))'
    mysqlDB.queryContent(query,id,metric)

    #second milestone
    id = 2
    metric = "input for # players"
    query = 'input.*?(\().*?(How&nbsp;many&nbsp;players).*?(\))'
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
    query0 = 'while'
    query1 = 'for'
    query = [query0,query1]
    mysqlDB.mulipleQueries(query, len(query), id, metric)
        

    #fifth milestone
    id = 5
    metric = "loop nested within if statement"
    query = []
    query0 = 'if.*?:.*?for'
    query1 = 'if.*?:.*?while'
    query = [query0,query1]
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
    query0 = 'else'
    query1 = 'elif'
    query = [query0,query1]
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
    query0 = 'else.*?input.*?(\().*?Our&nbsp;team.*?(\))'
    query1 = 'elif.*?input.*?(\().*?Our&nbsp;team.*?(\))'
    query = [query0,query1]
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