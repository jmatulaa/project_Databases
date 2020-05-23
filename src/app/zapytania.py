import pymysql

def wyswietlanie_druzyn(panstwo):

    connection = pymysql.connect(host='localhost',
                                 user='root',
                                 password='root',
                                 db='rozgrywki_pilki_noznej',
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)

    try:

        with connection.cursor() as cursor:
            sql = "SELECT nazwa_klubu, siedziba, trener_klubu, data_zalozenia, panstwo FROM klub WHERE panstwo=(%s)"
            cursor.execute(sql, panstwo)

            result = cursor.fetchall()
            print(result)
    finally:
        connection.close()