from datetime import datetime

from flask import render_template, Blueprint, redirect, url_for, session, request

admin_routes = Blueprint('admin_routes', __name__)


@admin_routes.route('/login/', methods=['GET', 'POST'])
def admin_login():
    from app import execute_query_one
    if request.method == 'POST':
        login_id = request.form['loginid']
        login_password = request.form['loginpassword']
        sql = f"SELECT * FROM admin WHERE loginid='{login_id}' AND password='{login_password}' AND status='Active'"
        rs = execute_query_one(sql)
        if rs:
            session.permanent = True
            session['rs_admin'] = rs
            session['adminid'] = rs['adminid']
            return redirect(url_for('admin_routes.admin_dashboard'))
        else:
            return render_template('adminlogin.html', err="Invalid Login Credentials")
    return render_template('adminlogin.html')


@admin_routes.route('/dashboard/', methods=['GET', 'POST'])
def admin_dashboard():
    from app import execute_static, get_count
    if 'adminid' not in session:
        return redirect(url_for('admin_routes.admin_login'))
    sql = f"SELECT COUNT(*) FROM feedbacktopic"
    fbt_count = execute_static(sql)
    sql = f"SELECT COUNT(*) FROM student"
    stud_count = execute_static(sql)
    sql = f"SELECT COUNT(*) FROM feedbackquestion_result GROUP BY date"
    fbr_count = get_count(sql)
    print("fbt_count: ", stud_count)
    return render_template('admindashboard.html', fbt_count=fbt_count, fbr_count=fbr_count, stud_count=stud_count)


@admin_routes.route('/feedback/topic/add', methods=['GET', 'POST'])
def admin_feedback_topic_add():
    global rs_edit
    rs_edit = {}
    from app import execute_query, execute_query_one, execute_update, execute_static
    if 'adminid' not in session:
        return redirect(url_for('admin_routes.admin_login'))
    if request.method == 'GET':
        sql = f"SELECT * FROM course WHERE course_status='Active'"
        courses = execute_query(sql)
        sql = f"SELECT * FROM faculty WHERE faculty_status='Active'"
        faculties = execute_query(sql)
        feedback_topic_id = request.args.get('feedbacktopicid')
        if feedback_topic_id:
            sql = f"SELECT * FROM feedbacktopic where feedbacktopicid ='{feedback_topic_id}'"
            rs_edit = execute_query_one(sql)
        status = request.args.get('st')
        if status:
            sql = f"UPDATE feedbacktopic SET feedbacktopic_status='{status}' WHERE feedbacktopicid='{feedback_topic_id}'"
            execute_update(sql)
        delete = request.args.get('del')
        if delete:
            sql = f"DELETE FROM feedbacktopic WHERE feedbacktopicid='{feedback_topic_id}'"
            execute_update(sql)
            return redirect(url_for('admin_routes.admin_feedback_topic_view'))
        return render_template('feedbacktopicadmin.html', courses=courses, rs_edit=rs_edit, faculties=faculties,
                               feedback_topic_id=feedback_topic_id)
    if request.method == 'POST':
        submit_question = request.form.get('submitquestion')
        print("Submit: ", submit_question, type(submit_question))
        if submit_question is not None and not session.get('fdb_topic_id'):
            print("POST: Submit Button")
            feedback_topic_id = session.get('feedback_topic_id')
            print("Submit: ", submit_question, type(submit_question))
            print("feedback_topic_id: ", feedback_topic_id, type(feedback_topic_id))
            return redirect(url_for('admin_routes.admin_feedback_topic_add', feedbacktopicid=feedback_topic_id))

        feedback_topic = request.form.get('feedback_topic')
        course_id = request.form.get('course_id')
        faculty_id = request.form.get('faculty_id')
        feedback_disptype = request.form.get('feedback_disptype')
        feedback_detail = request.form.get('feedbacktopic_detail')
        feedback_topic_status = "Approved"
        feedback_topic_id = request.form.get('feedback_topic_id')
        if feedback_topic_id is not "":
            print("POST: Update Feedback Button")
            sql = f"""UPDATE feedbacktopic SET feedback_topic='{feedback_topic}', 
            feedback_disptype='{feedback_disptype}', feedbacktopic_detail='{feedback_detail}', course_id='{course_id}'
            ,faculty_id='{faculty_id}' WHERE feedbacktopicid='{feedback_topic_id}'""";
            execute_update(sql)
            return redirect(url_for('admin_routes.admin_feedback_topic_add', feedbacktopicid=feedback_topic_id))
        print("POST: Post Feedback Button")
        sql = f"""
        INSERT INTO feedbacktopic (
            feedback_topic,
            course_id,
            faculty_id,
            feedbacktopic_status,
            feedback_disptype,
            feedbacktopic_detail,
            feedbacktopic_date
        ) VALUES (
            '{feedback_topic}',
            '{course_id}',
            '{faculty_id}',
            '{feedback_topic_status}',
            '{feedback_disptype}',
            '{feedback_detail}',
            '{datetime.now()}'
        )
        """
        execute_update(sql)
        sql = "SELECT MAX(feedbacktopicid) FROM feedbacktopic"
        feedback_topic_id = execute_static(sql)
        session['fdb_topic_id'] = feedback_topic_id
        return redirect(url_for('admin_routes.admin_feedback_topic_add', feedbacktopicid=feedback_topic_id))


@admin_routes.route('/feedback/topic/view', methods=['GET', 'POST'])
def admin_feedback_topic_view():
    return render_template('viewfeedbacktopicadmin.html')


@admin_routes.route('/logout/')
def admin_logout():
    session.clear()
    return redirect(url_for("home"))
