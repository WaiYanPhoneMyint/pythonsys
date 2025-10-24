from flask import Flask, render_template, request, redirect, url_for, session, flash
from flask_sqlalchemy import SQLAlchemy
from werkzeug.security import generate_password_hash, check_password_hash
from datetime import timedelta, datetime
# Removed unused serializers and secrets
# from itsdangerous import URLSafeTimedSerializer
# import secrets

app = Flask(__name__)

# --- Configurations ---
app.config['SECRET_KEY'] = 'your_super_secret_key_change_me'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:@localhost/system'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['PERMANENT_SESSION_LIFETIME'] = timedelta(days=1)

# --- Extensions ---
db = SQLAlchemy(app)

# --- Models ---
class Admin(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(120), unique=True, nullable=False)
    password = db.Column(db.String(200), nullable=False)
    
    # --- FIX: Removed reset token fields ---
    # reset_token = db.Column(db.String(100), nullable=True)
    # reset_token_expiry = db.Column(db.DateTime, nullable=True)

class Announcement(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    content = db.Column(db.Text, nullable=False)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)

class Customer(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    password = db.Column(db.String(200), nullable=False) # Admin can set this
    contact = db.Column(db.String(120), nullable=True)
    role = db.Column(db.String(20), nullable=False, default='Vip')

# --- Routes ---
@app.route('/')
def index():
    if 'user_id' not in session:
        return redirect(url_for('login'))
    all_customers = Customer.query.all()
    return render_template('index.html', users=all_customers)

@app.route('/login', methods=['GET', 'POST'])
def login():
    if 'user_id' in session:
        return redirect(url_for('index'))

    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')
        remember = request.form.get('remember')

        admin = Admin.query.filter_by(email=email).first()
        if admin and check_password_hash(admin.password, password):
            session['user_id'] = admin.id
            session['role'] = 'admin'
            session.permanent = True if remember else False
            flash('Admin login successful!', 'success')
            return redirect(url_for('index'))

        flash('Invalid email or password.', 'danger')
        return redirect(url_for('login'))

    announcements = Announcement.query.order_by(Announcement.created_at.desc()).all()
    return render_template('login.html', announcements=announcements)


@app.route('/logout')
def logout():
    session.clear()
    flash('You have been logged out.', 'info')
    return redirect(url_for('login'))

@app.route('/add-user', methods=['POST'])
def add_user():
    if 'user_id' not in session:
        return redirect(url_for('login'))

    username = request.form.get('username')
    email = request.form.get('email')
    password = request.form.get('password')
    contact = request.form.get('contact')
    role = request.form.get('role')

    existing_customer = Customer.query.filter(
        (Customer.username == username) | (Customer.email == email)
    ).first()

    if existing_customer:
        flash('Username or email already exists.', 'danger')
        return redirect(url_for('index'))

    hashed_pw = generate_password_hash(password, method='pbkdf2:sha256')
    new_customer = Customer(
        username=username,
        email=email,
        password=hashed_pw,
        contact=contact,
        role=role
    )
    db.session.add(new_customer)
    db.session.commit()

    flash('New customer added successfully!', 'success')
    return redirect(url_for('index'))

@app.route('/add-user-form')
def add_user_form():
    if 'user_id' not in session:
        return '', 401
    return render_template('add_user.html')


@app.route('/edit-user-form/<int:user_id>')
def edit_user_form(user_id):
    if 'user_id' not in session:
        return '', 401
    user = Customer.query.get_or_404(user_id)
    return render_template('edit_user.html', user=user)

@app.route('/update-user/<int:user_id>', methods=['POST'])
def update_user(user_id):
    if 'user_id' not in session:
        return redirect(url_for('login'))

    user = Customer.query.get_or_404(user_id)
    user.username = request.form.get('username')
    user.email = request.form.get('email')
    user.contact = request.form.get('contact')
    user.role = request.form.get('role')
    db.session.commit()

    flash('User updated successfully!', 'success')
    return redirect(url_for('index'))


@app.route('/delete-user/<int:user_id>', methods=['POST'])
def delete_user(user_id):
    if 'user_id' not in session:
        return redirect(url_for('login'))

    user = Customer.query.get_or_404(user_id)
    db.session.delete(user)
    db.session.commit()

    flash('User deleted successfully!', 'success')
    return redirect(url_for('index'))


@app.route('/register', methods=['GET', 'POST'])
def register():
    # Secured route. Only admins can register new admins.
    if 'user_id' not in session or session.get('role') != 'admin':
        flash('Access denied. Only admins can register new users.', 'danger')
        return redirect(url_for('login'))
    
    if request.method == 'GET':
        return render_template('register.html')
    
    # POST logic for creating a new Admin
    username = request.form.get('username')
    email = request.form.get('email')
    password = request.form.get('password')
    confirm = request.form.get('confirm')

    if not all([email, password, confirm]):
        flash('All fields are required.', 'danger')
        return redirect(url_for('register'))

    if password != confirm:
        flash('Passwords do not match.', 'danger')
        return redirect(url_for('register'))

    existing_admin = Admin.query.filter_by(email=email).first()
    if existing_admin:
        flash('Email already exists.', 'danger')
        return redirect(url_for('register'))

    hashed_pw = generate_password_hash(password, method='pbkdf2:sha256')
    new_admin = Admin(email=email, password=hashed_pw)
    db.session.add(new_admin)
    db.session.commit()

    flash('Admin registration successful!', 'success')
    return redirect(url_for('index'))

@app.route('/profile', methods=['GET', 'POST'])
def profile():
    if 'user_id' not in session or session.get('role') != 'admin':
        flash('Access denied.', 'danger')
        return redirect(url_for('login'))

    admin = Admin.query.get_or_404(session['user_id'])

    if request.method == 'POST':
        admin.email = request.form['email']

        current_pw = request.form.get('current_password')
        new_pw = request.form.get('new_password')
        confirm_pw = request.form.get('confirm_password')

        if current_pw or new_pw or confirm_pw:
            if not current_pw or not check_password_hash(admin.password, current_pw):
                flash('Current password is incorrect.', 'danger')
                return redirect(url_for('profile'))
            if not new_pw or new_pw != confirm_pw:
                flash('New passwords do not match.', 'danger')
                return redirect(url_for('profile'))
            
            admin.password = generate_password_hash(new_pw)
            flash('Password updated successfully.', 'success')
        else:
            flash('Profile email updated successfully.', 'success')

        db.session.commit()
        return redirect(url_for('profile'))

    return render_template('admin_profile.html', user=admin)

@app.route('/dashboard')
def dashboard():
    if 'user_id' not in session:
        return redirect(url_for('login'))

    total_users = Customer.query.count()
    vip_count = Customer.query.filter_by(role='Vip').count()
    crown_count = Customer.query.filter_by(role='Crown').count()
    premium_count = Customer.query.filter_by(role='Premium').count()

    return render_template('dashboard.html', total=total_users, vip=vip_count, crown=crown_count, premium=premium_count)

# --- FIX: Removed '/forgot-password' route ---
# @app.route('/forgot-password', methods=['GET', 'POST'])
# def forgot_password():
#     pass

# --- FIX: Removed '/reset-password' route ---
# @app.route('/reset-password/<token>', methods=['GET', 'POST'])
# def reset_password(token):
#     pass

@app.route('/announcement', methods=['GET', 'POST'])
def announcement():
    if 'user_id' not in session or session.get('role') != 'admin':
        flash('Access denied.', 'danger')
        return redirect(url_for('login'))
    
    if request.method == 'POST':
        content = request.form.get('content')
        if content:
            new_announcement = Announcement(content=content)
            db.session.add(new_announcement)
            db.session.commit()
            flash('Announcement posted!', 'success')
            return redirect(url_for('announcement'))
        else:
            flash('Announcement cannot be empty.', 'danger')
            
    announcements = Announcement.query.order_by(Announcement.created_at.desc()).all()
    return render_template('announcement.html', announcements=announcements)

@app.route('/edit-announcement/<int:id>', methods=['GET', 'POST'])
def edit_announcement(id):
    if 'user_id' not in session or session.get('role') != 'admin':
        flash('Access denied.', 'danger')
        return redirect(url_for('login'))
    
    announcement = Announcement.query.get_or_404(id)
    if request.method == 'POST':
        content = request.form.get('content')
        if content:
            announcement.content = content # Fixed: was announcement.content.content
            db.session.commit()
            flash('Announcement updated!', 'success')
            return redirect(url_for('announcement'))
        else:
            flash('Announcement cannot be empty.', 'danger')
            
    return render_template('edit_announcement.html', announcement=announcement)

@app.route('/delete-announcement/<int:id>', methods=['POST'])
def delete_announcement(id):
    if 'user_id' not in session or session.get('role') != 'admin':
        flash('Access denied.', 'danger')
        return redirect(url_for('login'))
    
    announcement = Announcement.query.get_or_404(id)
    db.session.delete(announcement)
    db.session.commit()
    flash('Announcement deleted!', 'success')
    return redirect(url_for('announcement'))


if __name__ == '__main__':
    # Create tables if they don't exist
    with app.app_context():
        db.create_all()
    app.run(debug=True)

