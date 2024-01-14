from datetime import timedelta

from flask import Flask, render_template
from flask_mysqldb import MySQL

from routes.admin_routes import admin_routes
from routes.api_routes import api_routes
from routes.student_routes import student_routes

app = Flask(__name__, static_folder='static')
app.secret_key = 'Mercenary5'

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'live_student_feedback_system'

mysql = MySQL(app)

app.register_blueprint(student_routes, url_prefix="/student")
app.register_blueprint(admin_routes, url_prefix="/admin")
app.register_blueprint(api_routes, url_prefix="/api")


@app.route('/')
def home():
    return render_template("index.html")


def execute_static(query):
    cursor = mysql.connection.cursor()
    cursor.execute(query)
    res = cursor.fetchall()
    mysql.connection.commit()
    cursor.close()
    print("RESULTS:", res)
    return res[0][0]


def execute_query(query):
    cursor = mysql.connection.cursor()
    cursor.execute(query)
    result_set = cursor.fetchall()
    column_names = [desc[0] for desc in cursor.description]  # Fetch column names
    result_dict = []
    for row in result_set:
        result_dict.append(dict(zip(column_names, row)))
    mysql.connection.commit()
    cursor.close()
    return result_dict


def execute_query_one(query):
    cursor = mysql.connection.cursor()
    cursor.execute(query)
    result_set = cursor.fetchone()
    column_names = [desc[0] for desc in cursor.description]
    mysql.connection.commit()
    cursor.close()
    if result_set is not None:
        return dict(zip(column_names, result_set))
    else:
        return None


def execute_update(query):
    try:
        cursor = mysql.connection.cursor()
        cursor.execute(query)
        mysql.connection.commit()
        cursor.close()
        return True
    except Exception as e:
        print(e)
        return False


if __name__ == '__main__':
    app.run(debug=True)
