from datetime import datetime

from flask import render_template, Blueprint, redirect, url_for, session, request, jsonify

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


@admin_routes.route('/feedback/topic/add/question', methods=['GET', 'POST'])
def admin_feedback_topic_add_question():
    if request.method == 'POST':
        from app import execute_update
        POST = request.json
        question = POST.get('question')
        option1 = POST.get('option1')
        option2 = POST.get('option2')
        option3 = POST.get('option3')
        option4 = POST.get('option4')
        option5 = POST.get('option5')
        option6 = POST.get('option6')
        option7 = POST.get('option7')
        option8 = POST.get('option8')
        option9 = POST.get('option9')
        option10 = POST.get('option10')
        question_type = POST.get('question_type')
        feedback_topic_id = POST.get('feedback_topic_id')

        sql = f"""
        INSERT INTO feedbackquestion (
            feedbacktopicid,
            question,
            option1,
            option2,
            option3,
            option4,
            option5,
            option6,
            option7,
            option8,
            option9,
            option10,
            question_type,
            img,
            status
        ) VALUES (
            '{feedback_topic_id}', '{question}', '{option1}', '{option2}', '{option3}', '{option4}', '{option5}', '{option6}', '{option7}', '{option8}', '{option9}', '{option10}', '{question_type}', 209312, 'Active'
        )
        """
        execute_update(sql)
        return {"success": True, "req": request.json}


@admin_routes.route('/feedback/topic/add/', methods=['GET', 'POST'])
def admin_feedback_topic_add():
    if 'adminid' not in session:
        return redirect(url_for('admin_routes.admin_login'))
    global rs_edit, rs_question_edit
    rs_edit = {}
    rs_question_edit = {}
    from app import execute_query, execute_query_one, execute_update, execute_static
    if 'adminid' not in session:
        return redirect(url_for('admin_routes.admin_login'))
    if request.method == 'GET':
        sql = f"SELECT * FROM course WHERE course_status='Active'"
        courses = execute_query(sql)
        sql = f"SELECT * FROM faculty WHERE faculty_status='Active'"
        faculties = execute_query(sql)
        feedback_topic_id = request.args.get('feedbacktopicid')

        feedback_question_id = request.args.get('feedbackquestionid')
        if feedback_question_id:
            sql = f"DELETE FROM feedbackquestion WHERE feedbackquestionid='{feedback_question_id}'"
            execute_update(sql)

        status = request.args.get('st')
        if status:
            sql = f"UPDATE feedbacktopic SET feedbacktopic_status='{status}' WHERE feedbacktopicid='{feedback_topic_id}'"
            execute_update(sql)

        delete = request.args.get('del')
        if delete:
            sql = f"DELETE FROM feedbacktopic WHERE feedbacktopicid='{feedback_topic_id}'"
            execute_update(sql)
            return redirect(url_for('admin_routes.admin_feedback_topic_view'))

        sql = f"SELECT * FROM feedbackquestion WHERE feedbacktopicid='{feedback_topic_id}'"
        fbq = execute_query(sql)
        fbq_count = len(fbq)

        if feedback_topic_id:
            sql = f"SELECT * FROM feedbacktopic where feedbacktopicid ='{feedback_topic_id}'"
            rs_edit = execute_query_one(sql)

        return render_template('feedbacktopicadmin.html', courses=courses, rs_edit=rs_edit, faculties=faculties,
                               feedback_topic_id=feedback_topic_id, rs_question_edit=rs_question_edit, status=status,
                               fbq_count=fbq_count, fbq=fbq)
    if request.method == 'POST':
        feedback_topic = request.form.get('feedback_topic')
        course_id = request.form.get('course_id')
        faculty_id = request.form.get('faculty_id')
        feedback_disptype = request.form.get('feedback_disptype')
        feedback_detail = request.form.get('feedbacktopic_detail')
        feedback_topic_status = "Approved"
        feedback_topic_id = request.form.get('feedback_topic_id')
        if feedback_topic_id != "":
            print("POST: Update Feedback Button")
            sql = f"""UPDATE feedbacktopic SET feedback_topic='{feedback_topic}', 
            feedback_disptype='{feedback_disptype}', feedbacktopic_detail='{feedback_detail}', course_id='{course_id}'
            ,faculty_id='{faculty_id}' WHERE feedbacktopicid='{feedback_topic_id}'"""
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

        return redirect(url_for('admin_routes.admin_feedback_topic_add', feedbacktopicid=feedback_topic_id,
                                rs_question_edit=rs_question_edit))


@admin_routes.route('/feedback/topic/view', methods=['GET', 'POST'])
def admin_feedback_topic_view():
    from app import execute_query
    if 'adminid' not in session:
        return redirect(url_for('admin_routes.admin_login'))
    sql = f"""
        SELECT
            fb.feedbacktopicid,
            fb.feedback_topic,
            fb.feedbacktopic_date,
            fb.feedbacktopic_status,
            COUNT(*) AS fbq_count
        FROM feedbacktopic fb
        JOIN feedbackquestion fq
        ON fb.feedbacktopicid = fq.feedbacktopicid
        GROUP BY fb.feedbacktopicid,
            fb.feedback_topic,
            fb.feedbacktopic_date,
            fb.feedbacktopic_status;
        """
    result_set = execute_query(sql)
    return render_template('viewfeedbacktopicadmin.html', result_set=result_set)


@admin_routes.route('/feedback/report/view/', methods=['GET', 'POST'])
def admin_feedback_report_view():
    from app import execute_query, execute_query_one
    if 'adminid' not in session:
        return redirect(url_for('admin_routes.admin_login'))
    sql = f"SELECT * FROM feedbackquestion_result WHERE feedbacktopicid={request.args.get('feedbacktopicid')} GROUP BY studentid"
    result_set = execute_query(sql)
    for row in result_set:
        sql = f"SELECT * FROM student WHERE studentid='{row['studentid']}'"
        stud = execute_query_one(sql)
        row['student'] = stud
        sql = f"SELECT * FROM course WHERE course_id='{stud['course_id']}'"
        row['course'] = execute_query_one(sql)

    return render_template('viewfeedbackreport.html', result_set=result_set)


@admin_routes.route('/feedback/report/view/student/<student_id>', methods=['GET', 'POST'])
def admin_feedback_report_view_student(student_id):
    from app import execute_query, execute_query_one
    if 'adminid' not in session:
        return redirect(url_for('admin_routes.admin_login'))
    feedback_topic_id = request.args.get('feedbacktopicid')
    if not feedback_topic_id:
        return redirect(url_for('admin_routes.admin_dashboard'))
    sql = f"SELECT * FROM student WHERE studentid='{student_id}'"
    stud = execute_query_one(sql)
    sql = f"SELECT * FROM course WHERE course_id='{stud['course_id']}'"
    course = execute_query_one(sql)
    sql = f"SELECT * FROM feedbacktopic where feedbacktopicid='{feedback_topic_id}'"
    rsedit = execute_query_one(sql)
    sql = f"""
        SELECT fbq_r.*, fbq.question,fbq.option1,fbq.option2,fbq.option3,fbq.option4,fbq.option5,fbq.option6,fbq.option7,fbq.option8,fbq.option9,fbq.option10,fbq.img 
        FROM `feedbackquestion_result` fbq_r 
        LEFT JOIN feedbackquestion fbq 
        ON fbq_r.feedbackquestionid=fbq.feedbackquestionid 
        WHERE fbq_r.feedbacktopicid='{feedback_topic_id}' AND  fbq_r.studentid='{student_id}' 
        ORDER BY fbq_r.feedbackquestion_resultid
        """
    fbq_result = execute_query(sql)
    answered = 0
    unanswered = 0
    for f in fbq_result:
        if f['selectedanswer'] != "":
            answered = answered + 1
        else:
            unanswered = unanswered + 1
    return render_template('admin_feedbackquestion_success.html', stud=stud, course=course, rsedit=rsedit,
                           fbq_result=fbq_result, answered=answered, unanswered=unanswered)


@admin_routes.route('/student/view/', methods=['GET', 'POST'])
def admin_view_student():
    from app import execute_query, execute_query_one, execute_update
    if 'adminid' not in session:
        return redirect(url_for('admin_routes.admin_login'))
    del_id = request.args.get('delid')
    if del_id:
        sql = f"DELETE FROM student WHERE studentid = {del_id}"
        execute_update(sql)
        return redirect(url_for('admin_routes.admin_view_student'))
    sql = f"SELECT * FROM student WHERE status != ''"
    rs_student = execute_query(sql)
    for rs in rs_student:
        sql = f"SELECT * FROM course WHERE course_id='{rs['course_id']}'"
        rs['course'] = execute_query_one(sql)
    return render_template('viewstudent.html', rs_student=rs_student)


@admin_routes.route('/student/add/', methods=['GET', 'POST'])
def admin_add_student():
    from app import execute_query, execute_query_one, execute_update, execute_static
    global rsedit, courses
    rsedit = {}
    courses = {}
    if 'adminid' not in session:
        return redirect(url_for('admin_routes.admin_login'))
    edit_id = request.args.get('editid')
    if request.method == "POST":
        data = request.form
        if edit_id:
            sql = f"UPDATE student SET studentname='{data['studentname']}',rollno='{data['rollno']}',`dateofbirth`='{data['dateofbirth']}',`password`='{data['password']}'," \
                  f"`course_id`='{data['studentclass']}',`section`='{data['section']}',status='{data['status']}' WHERE studentid = {edit_id}"
            execute_update(sql)
            _id = edit_id
        else:
            sql = f"INSERT INTO student SET studentname='{data['studentname']}',rollno='{data['rollno']}',`dateofbirth`='{data['dateofbirth']}',`password`='{data['password']}'," \
                  f"`course_id`='{data['studentclass']}',`section`='{data['section']}',status='{data['status']}'"
            execute_update(sql)
            sql = "SELECT MAX(studentid) FROM student"
            _id = execute_static(sql)
        return redirect(url_for('admin_routes.admin_add_student', editid=_id))
    if edit_id:
        sql = f"SELECT * FROM student WHERE studentid = '{edit_id}'"
        rsedit = execute_query_one(sql)
    sql = f"SELECT * FROM course WHERE course_status='Active'"
    courses = execute_query(sql)
    return render_template('student.html', rs_edit=rsedit, courses=courses)


@admin_routes.route('/faculty/add/', methods=['GET', 'POST'])
def admin_faculty_add():
    from app import execute_query_one, execute_update, execute_static
    if 'adminid' not in session:
        return redirect(url_for('admin_routes.admin_login'))
    rsedit = {}
    edit_id = request.args.get('editid')
    if request.method == "POST":
        data = request.form
        if edit_id:
            sql = f"UPDATE faculty SET faculty_name='{data['faculty_name']}',faculty_designation='{data['faculty_designation']}',`faculty_profile`='{data['faculty_profile']}',`faculty_status`='{data['faculty_status']}'" \
                  f"WHERE faculty_id = {edit_id}"
            execute_update(sql)
            _id = edit_id
        else:
            sql = f"INSERT INTO faculty SET faculty_name='{data['faculty_name']}',faculty_designation='{data['faculty_designation']}',`faculty_profile`='{data['faculty_profile']}',`faculty_status`='{data['faculty_status']}'"
            execute_update(sql)
            print("INSERT", sql)
            sql = "SELECT MAX(faculty_id) FROM faculty"
            _id = execute_static(sql)
        return redirect(url_for('admin_routes.admin_faculty_add', editid=_id))
    if edit_id:
        sql = f"SELECT * FROM faculty WHERE faculty_id = '{edit_id}'"
        rsedit = execute_query_one(sql)
    return render_template('faculty.html', rs_edit=rsedit)


@admin_routes.route('/faculty/view/', methods=['GET', 'POST'])
def admin_faculty_view():
    from app import execute_query, execute_update
    if 'adminid' not in session:
        return redirect(url_for('admin_routes.admin_login'))
    del_id = request.args.get('delid')
    if del_id:
        sql = f"DELETE FROM faculty WHERE faculty_id = {del_id}"
        execute_update(sql)
        return redirect(url_for('admin_routes.admin_faculty_view'))
    sql = f"SELECT * FROM faculty"
    result_set = execute_query(sql)
    return render_template('viewfaculty.html', result_set=result_set)


@admin_routes.route('/course/add/', methods=['GET', 'POST'])
def admin_course_add():
    from app import execute_query_one, execute_update, execute_static
    if 'adminid' not in session:
        return redirect(url_for('admin_routes.admin_login'))
    rsedit = {}
    edit_id = request.args.get('editid')
    if request.method == "POST":
        data = request.form
        if edit_id:
            sql = f"UPDATE course SET course_title='{data['course_title']}',course_description='{data['course_description']}',`course_status`='{data['course_status']}'" \
                  f"WHERE course_id = {edit_id}"
            execute_update(sql)
            _id = edit_id
        else:
            sql = f"INSERT INTO course SET course_title='{data['course_title']}',course_description='{data['course_description']}',`course_status`='{data['course_status']}'"
            execute_update(sql)
            print("INSERT", sql)
            sql = "SELECT MAX(course_id) FROM course"
            _id = execute_static(sql)
        return redirect(url_for('admin_routes.admin_course_add', editid=_id))
    if edit_id:
        sql = f"SELECT * FROM course WHERE course_id = '{edit_id}'"
        rsedit = execute_query_one(sql)
    return render_template('course.html', rs_edit=rsedit)


@admin_routes.route('/course/view/', methods=['GET', 'POST'])
def admin_course_view():
    from app import execute_query, execute_update
    if 'adminid' not in session:
        return redirect(url_for('admin_routes.admin_login'))
    del_id = request.args.get('delid')
    if del_id:
        sql = f"DELETE FROM course WHERE course_id = {del_id}"
        execute_update(sql)
        return redirect(url_for('admin_routes.admin_course_view'))
    sql = f"SELECT * FROM course"
    result_set = execute_query(sql)
    return render_template('viewcourse.html', result_set=result_set)


@admin_routes.route('/add/', methods=['GET', 'POST'])
def admin_add():
    from app import execute_query_one, execute_update, execute_static
    if 'adminid' not in session:
        return redirect(url_for('admin_routes.admin_login'))
    rsedit = {}
    edit_id = request.args.get('editid')
    if request.method == "POST":
        data = request.form
        if edit_id:
            sql = f"UPDATE admin SET adminname='{data['adminname']}',loginid='{data['loginid']}',`password`='{data['password']}',`status`='{data['status']}'" \
                  f"WHERE adminid = {edit_id}"
            execute_update(sql)
            _id = edit_id
        else:
            sql = f"INSERT INTO admin SET adminname='{data['adminname']}',loginid='{data['loginid']}',`password`='{data['password']}',`status`='{data['status']}'"
            execute_update(sql)
            print("INSERT", sql)
            sql = "SELECT MAX(adminid) FROM admin"
            _id = execute_static(sql)
        return redirect(url_for('admin_routes.admin_add', editid=_id))
    if edit_id:
        sql = f"SELECT * FROM admin WHERE adminid = '{edit_id}'"
        rsedit = execute_query_one(sql)
    return render_template('admin.html', rs_edit=rsedit)


@admin_routes.route('/view/', methods=['GET', 'POST'])
def admin_view():
    from app import execute_query, execute_update
    if 'adminid' not in session:
        return redirect(url_for('admin_routes.admin_login'))
    del_id = request.args.get('delid')
    if del_id:
        sql = f"DELETE FROM admin WHERE adminid = {del_id}"
        execute_update(sql)
        return redirect(url_for('admin_routes.admin_view'))
    sql = f"SELECT * FROM admin WHERE admin.loginid != 'admin'"
    result_set = execute_query(sql)
    return render_template('viewadmin.html', result_set=result_set)


@admin_routes.route('/profile/', methods=['GET', 'POST'])
def admin_profile():
    from app import execute_query_one, execute_update
    if 'adminid' not in session:
        return redirect(url_for('admin_routes.admin_login'))
    if request.method == "POST":
        data = request.form
        sql = f"UPDATE admin SET adminname='{data['adminname']}',loginid='{data['loginid']}'" \
              f"WHERE adminid = {session['adminid']}"
        execute_update(sql)
    sql = f"SELECT * FROM admin WHERE adminid = '{session['adminid']}'"
    rsedit = execute_query_one(sql)
    return render_template('adminprofile.html', rs_edit=rsedit)


@admin_routes.route('/change_password/', methods=['GET', 'POST'])
def admin_change_password():
    from app import execute_static, execute_update
    if request.method == 'POST':
        old = request.form['opassword']
        new = request.form['npassword']
        con = request.form['cpassword']
        sql = f"SELECT COUNT(*) FROM admin WHERE adminid='{session['adminid']}' AND password='{old}'"
        rs = execute_static(sql)
        if rs == 1 and new == con:
            sql = f"UPDATE admin SET password='{new}' WHERE adminid='{session['adminid']}'"
            execute_update(sql)
            return render_template('adminchangepassword.html', msg="Password changed successfully")
        elif new == con:
            return render_template('adminchangepassword.html', msg="New password and Confirm password do not match")
        else:
            return render_template('adminchangepassword.html', msg="Old password is not valid")
    return render_template('adminchangepassword.html')


@admin_routes.route('/test/', methods=['GET', 'POST'])
def admin_test():
    return jsonify(dict(request.form))


@admin_routes.route('/logout/')
def admin_logout():
    session.clear()
    return redirect(url_for("home"))
