from flask import Blueprint, request, session, jsonify

api_routes = Blueprint('api_routes', __name__)


@api_routes.route('/fbq/answer/')
def api_fbq_answer():
    from app import execute_update, execute_static
    answer = request.args['answer']
    fbq_result_id = request.args['feedbackquestion_resultid']
    sql = f"UPDATE feedbackquestion_result SET selectedanswer='{answer}' WHERE feedbackquestion_resultid='{fbq_result_id}'"
    _ = execute_update(sql)
    sql = f"SELECT COUNT(*) FROM feedbackquestion_result WHERE feedbacktopicid='{session['fb_topic_id']}' AND date='{session['date']}' AND studentid='{session['s_id']}' AND selectedanswer != ''"
    fbq_answered = execute_static(sql)
    sql = f"SELECT COUNT(*) FROM feedbackquestion_result WHERE feedbacktopicid='{session['fb_topic_id']}' AND date='{session['date']}' AND studentid='{session['s_id']}' AND selectedanswer = ''"
    fbq_unanswered = execute_static(sql)
    return jsonify({'fbq_answered': fbq_answered, 'fbq_unanswered': fbq_unanswered})


@api_routes.route('/date/reset')
def api_reset_date():
    session['date'] = None
    return {'status': 'success'}
