from flask import render_template, Blueprint, redirect, url_for, request,session

api_routes = Blueprint('api_routes', __name__)


@api_routes.route('/fbq/answer/')
def api_login():
    from app import execute_update, execute_static, execute_query_one
    answer = request.args['answer']
    fbq_result_id = request.args['feedbackquestion_resultid']
    sql = f"UPDATE feedbackquestion_result SET selectedanswer='{answer}' WHERE feedbackquestion_resultid='{fbq_result_id}'"
    _ = execute_update(sql)
    sql = f"SELECT COUNT(*) FROM feedbackquestion_result WHERE feedbacktopicid='{session['fbq_topic_id']}' AND studentid='{session['s_id']}' AND selectedanswer != ''"
    fbq_answered = execute_static(sql)
    sql = f"SELECT COUNT(*) FROM feedbackquestion_result WHERE feedbacktopicid='{session['fbq_topic_id']}' AND studentid='{session['s_id']}' AND selectedanswer = ''"
    fbq_unanswered = execute_static(sql)
    return {
        "fbq_answered": fbq_answered,
        "fbq_unanswered": fbq_unanswered
    }


@api_routes.route('/logout/')
def api_logout():
    return redirect(url_for("home"))
