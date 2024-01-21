from datetime import datetime

from flask import render_template, Blueprint, redirect, url_for, request, session

student_routes = Blueprint('student_routes', __name__)


@student_routes.route('/login/', methods=['GET', 'POST'])
def student_login():
    if request.method == 'POST':
        from app import execute_static
        email = request.form['emailid']
        password = request.form['loginpassword']
        checked = request.form.get('remember')
        if checked == 'on':
            session.permanent = True
        session['s_email'] = email
        session['s_password'] = password
        sql = f"SELECT COUNT(*) FROM student WHERE email_id='{email}' AND password='{password}' AND status='Active'"
        res = execute_static(sql)
        if res == 1:
            return redirect(url_for('student_routes.student_dashboard'))
        else:
            return render_template('studentlogin.html', disp=True, msg='Invalid Email or Password')
    else:
        return render_template('studentlogin.html', disp=False)


@student_routes.route('/logout/')
def student_logout():
    session.clear()
    return redirect(url_for("home"))


@student_routes.route('/register/', methods=['GET', 'POST'])
def student_register():
    from app import execute_update, execute_static, execute_query
    if request.method == "POST":
        full_name = request.form['studentname']
        roll_no = request.form['rollno']
        email_id = request.form['email_id']
        mothers_no = request.form['mothers_no']
        fathers_no = request.form['fathers_no']
        student_no = request.form['student_no']
        password = request.form['password']
        date_of_birth = request.form['dateofbirth']
        student_course = request.form['studentclass']
        student_year = request.form['studentclass1']
        section = request.form['section']
        sql = f"SELECT COUNT(*) FROM student WHERE email_id='{email_id}'"
        count = execute_static(sql)
        if count == 1:
            return render_template('studentregister.html', err='Email Already Exists')
        sql_statement = f"""
        INSERT INTO student (
          studentname, email_id, student_no, mothers_no, fathers_no, rollno, dateofbirth, password, course_id, years_id,
          section, status, academicyear
        )
        VALUES (
          '{full_name}', '{email_id}', '{student_no}', '{mothers_no}', '{fathers_no}', '{roll_no}', '{date_of_birth}', '{password}', '{student_course}', '{student_year}', '{section}',
          'Active',
          '2023-24'
        );
        """
        success = execute_update(sql_statement)
        if success:
            return render_template('studentlogin.html', disp=True, msg='Registered Successfully')
        else:
            return render_template('studentregister.html', err='Registration Failed')

    sql = f"SELECT * FROM course WHERE course_status='Active'"
    courses = execute_query(sql)
    sql = f"SELECT * FROM years WHERE years_status='Active'"
    years = execute_query(sql)
    return render_template('studentregister.html', courses=courses, years=years)


@student_routes.route('/dashboard/')
def student_dashboard():
    from app import execute_static, execute_query, execute_query_one
    email = session['s_email']
    password = session['s_password']
    student = execute_query_one(
        f"SELECT studentid, course_id FROM student WHERE email_id='{email}' AND password='{password}' AND status='Active'")
    _id = student['studentid']
    obj = {
        "id": _id,
        "fb_topic_count": execute_static(f"SELECT COUNT(*) FROM feedbacktopic WHERE course_id IN(0,{student['course_id']})"),
        "fb_ans_count": len(execute_query(
            f"SELECT * FROM feedbackquestion_result WHERE studentid='{_id}' GROUP BY date")),
    }
    print("SQL:", f"SELECT COUNT(*) FROM feedbacktopic WHERE course_id IN(0,{student['course_id']})")
    session['s_id'] = _id
    session['course_id'] = execute_static(f"SELECT course_id FROM student WHERE studentid='{_id}'")
    return render_template('studentdashboard.html', obj=obj)


@student_routes.route('/participate_feedback/')
def student_participate_feedback():
    from app import execute_query, execute_static
    session['date'] = None
    sql = "SELECT * FROM feedbacktopic " \
          "WHERE feedbacktopicid!='0' AND feedbacktopic_status='Approved' " \
          f"AND (course_id='{session['course_id']}' OR course_id='0' ) ORDER BY feedbacktopicid DESC"
    result_set = execute_query(sql)
    for row in result_set:
        sql = f"SELECT * FROM faculty WHERE faculty_id='{row['faculty_id']}'"
        faculty = execute_query(sql)
        sql = f"SELECT * FROM feedbackquestion WHERE feedbacktopicid={row['feedbacktopicid']}"
        questions = execute_query(sql)
        sql = f"SELECT COUNT(*) FROM feedbackquestion WHERE feedbacktopicid={row['feedbacktopicid']}"
        q_count = execute_static(sql)
        sql = "select * from feedbackquestion_result " \
              f"WHERE feedbacktopicid={row['feedbacktopicid']} AND studentid={session['s_id']}"
        fbq_res = execute_query(sql)
        row['faculty'] = faculty
        row['questions'] = questions
        row['q_count'] = q_count
        row['fbq_res'] = fbq_res
    return render_template('participatefeedback.html', result_set=result_set, s_id=session['s_id'])


@student_routes.route('/feedback/result')
def feedback_result():
    from app import execute_query_one, execute_query, execute_static
    feedbacktopicid = int(request.args.get('feedbacktopicid'))
    studentid = int(request.args.get('studentid'))
    sql = f"SELECT * FROM feedbacktopic WHERE feedbacktopicid='{feedbacktopicid}'"
    rs = execute_query_one(sql)
    sql = f"SELECT * FROM student WHERE studentid='{studentid}'"
    stud = execute_query_one(sql)
    sql = f"SELECT * FROM course where course_id='{stud['course_id']}'"
    course = execute_query_one(sql)
    sql = f"SELECT * FROM faculty where faculty_id='{rs['faculty_id']}'"
    faculty = execute_query_one(sql)
    sql = f"SELECT COUNT(*) FROM feedbackquestion_result WHERE feedbacktopicid='{feedbacktopicid}' AND studentid='{studentid}' AND selectedanswer != ''"
    fbq_answered = execute_static(sql)
    sql = f"SELECT COUNT(*) FROM feedbackquestion_result WHERE feedbacktopicid='{feedbacktopicid}' AND studentid='{studentid}' AND selectedanswer = ''"
    fbq_unanswered = execute_static(sql)
    sql = f"""SELECT feedbackquestion_result.*, feedbackquestion.question,feedbackquestion.option1,feedbackquestion.option2,feedbackquestion.option3,feedbackquestion.option4,feedbackquestion.option5,feedbackquestion.option6,feedbackquestion.option7,feedbackquestion.option8,feedbackquestion.option9,feedbackquestion.option10,feedbackquestion.img 
    FROM `feedbackquestion_result` LEFT JOIN feedbackquestion ON feedbackquestion_result.feedbackquestionid=feedbackquestion.feedbackquestionid 
    WHERE feedbackquestion_result.feedbacktopicid='{feedbacktopicid}' AND  feedbackquestion_result.studentid='{studentid}' ORDER BY feedbackquestion_result.feedbackquestion_resultid"""
    fbq_rez = execute_query(sql)
    print(course, type(course))
    return render_template('feedbackquestion_success.html', rs=rs, stud=stud, course=course, fbq_rez=fbq_rez,
                           fbq_answered=fbq_answered, fbq_unanswered=fbq_unanswered, faculty=faculty)


@student_routes.route('/feedback/panel')
def feedback_panel():
    from app import execute_update, execute_query_one, execute_query, execute_static
    feedback_topic_id = int(request.args.get('feedbacktopicid'))
    student_id = session['s_id']
    if session.get('fbq_date') != f"{session.get('fb_topic_id')}|{session.get('date')}":
        session['date'] = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        session['fbq_date'] = f"{feedback_topic_id}|{session['date']}"
        session['fb_topic_id'] = feedback_topic_id
        sql = f"INSERT INTO feedbackquestion_result (feedbacktopicid,studentid,date,feedbackquestionid,selectedanswer) " \
              f"SELECT '{feedback_topic_id}', '{student_id}', '{session['date']}', feedbackquestionid, '' " \
              f"FROM feedbackquestion WHERE feedbacktopicid='{feedback_topic_id}'"

        execute_update(sql)
        return redirect(url_for('student_routes.feedback_panel', feedbacktopicid=feedback_topic_id))

    sql = f"SELECT * FROM feedbacktopic WHERE feedbacktopicid='{feedback_topic_id}'"
    rs = execute_query_one(sql)
    sql = f"SELECT * FROM student WHERE studentid='{student_id}'"
    stud = execute_query_one(sql)
    sql = f"SELECT COUNT(*) FROM feedbackquestion_result WHERE feedbacktopicid='{feedback_topic_id}' AND date='{session['date']}' AND studentid='{student_id}' AND selectedanswer != ''"
    fbq_answered = execute_static(sql)
    sql = f"SELECT COUNT(*) FROM feedbackquestion_result WHERE feedbacktopicid='{feedback_topic_id}' AND date='{session['date']}' AND studentid='{student_id}' AND selectedanswer = ''"
    fbq_unanswered = execute_static(sql)
    sql = f"""SELECT fr.*, fq.question, fq.question_type, fq.img,
    fq.option1, fq.option2, fq.option3, fq.option4, fq.option5, fq.option6, fq.option7, fq.option8, fq.option9, fq.option10
    FROM feedbackquestion_result fr LEFT JOIN feedbackquestion fq ON fr.feedbackquestionid = fq.feedbackquestionid 
    WHERE fr.feedbacktopicid = '{feedback_topic_id}' AND fr.studentid = '{session['s_id']}' 
    ORDER BY fr.feedbackquestion_resultid"""
    fbq_rez = execute_query(sql)
    print("FBQ REZ:", fbq_rez)
    return render_template('feedbackpanel.html', rs=rs, stud=stud, fbq_rez=fbq_rez, fbq_answered=fbq_answered,
                           fbq_unanswered=fbq_unanswered, fbt=feedback_topic_id, sid=session['s_id'])


@student_routes.route('/profile', methods=['GET', 'POST'])
def student_profile():
    from app import execute_query_one, execute_update
    if request.method == 'POST':
        student_name = request.form['studentname']
        roll_no = request.form['rollno']
        email_id = request.form['email_id']
        password = request.form['password']
        date_of_birth = request.form['dateofbirth']
        course_id = request.form['course_id']
        section = request.form['section']
        student_no = request.form['student_no']
        mothers_no = request.form['mothers_no']
        fathers_no = request.form['fathers_no']
        sql = f"UPDATE student SET studentname='{student_name}',rollno='{roll_no}',email_id='{email_id}',`dateofbirth`='{date_of_birth}',`course_id`='{course_id}',`section`='{section}',`password`='{password}',`student_no`='{student_no}',`mothers_no`='{mothers_no}',`fathers_no`='{fathers_no}' WHERE studentid='{session['s_id']}'"
        execute_update(sql)

    sql = f"SELECT * FROM student WHERE studentid='{session['s_id']}'"
    rs = execute_query_one(sql)
    sql = f"SELECT * FROM course WHERE course_id='{rs['course_id']}'"
    course = execute_query_one(sql)
    return render_template('studentprofile.html', rs=rs, course=course)


@student_routes.route('/changepassword', methods=['GET', 'POST'])
def student_change_password():
    from app import execute_static, execute_update
    if request.method == 'POST':
        old = request.form['opassword']
        new = request.form['npassword']
        con = request.form['cpassword']
        sql = f"SELECT COUNT(*) FROM student WHERE studentid='{session['s_id']}' AND password='{old}'"
        rs = execute_static(sql)
        if rs == 1 and new == con:
            sql = f"UPDATE student SET password='{new}' WHERE studentid='{session['s_id']}'"
            execute_update(sql)
            return render_template('studentchangepassword.html', msg="Password changed successfully")
        elif new == con:
            return render_template('studentchangepassword.html', msg="New password and Confirm password do not match")
        else:
            return render_template('studentchangepassword.html', msg="Old password is not valid")

    return render_template('studentchangepassword.html')
