from flask import render_template, Blueprint, redirect, url_for

admin_routes = Blueprint('admin_routes', __name__)


@admin_routes.route('/login/')
def admin_login():
    return render_template('adminlogin.html')


@admin_routes.route('/logout/')
def admin_logout():
    return redirect(url_for("home"))
