import pymysql

# Connect to the database
connection = pymysql.connect(host='localhost',
                             user='root',
                             password='',
                             db='rozgrywki_pilki_noznej',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)

#testowy select
try:

    with connection.cursor() as cursor:
        sql = "SELECT nazwa_klubu, siedziba, trener_klubu, data_zalozenia, panstwo FROM klub WHERE panstwo=(%s)"
        cursor.execute(sql, 'Polska')

        result = cursor.fetchall()
        print(result)
finally:
    connection.close()