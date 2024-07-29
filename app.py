from flask import Flask, render_template, request, redirect, url_for, flash, session
import mysql.connector
from datetime import datetime

app = Flask(__name__, template_folder='templates')
app.secret_key = 'sk'  # Replace with a secure secret key

# Configure your MySQL database connection
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="testseries"
)

cursor = db.cursor()

def get_tests():
    today = datetime.now().date()

    # Update test status to 'active' for today's date
    cursor.execute("""
        UPDATE upcoming_tests
        SET status = 'active'
        WHERE date_of_exam = %s AND status = 'upcoming'
    """, (today,))

    # Update test status to 'inactive' for past tests
    cursor.execute("""
        UPDATE upcoming_tests
        SET status = 'inactive'
        WHERE date_of_exam < %s
    """, (today,))

    # Fetch upcoming tests and active tests
    cursor.execute("SELECT * FROM upcoming_tests WHERE status = 'upcoming'")
    upcoming_tests = cursor.fetchall()

    cursor.execute("SELECT * FROM upcoming_tests WHERE status = 'active'")
    active_tests = cursor.fetchall()

    return upcoming_tests, active_tests

@app.route('/')
def index():
    upcoming_tests, active_tests = get_tests()
    return render_template('index.html', upcoming_tests=upcoming_tests, active_tests=active_tests)

@app.route('/login', methods=['POST'])
def login():
    username = request.form['username']
    password = request.form['password']

    # Query the database for the user
    query = "SELECT * FROM users WHERE username = %s AND password = %s"
    cursor.execute(query, (username, password))
    result = cursor.fetchone()

    if result:
        session['username'] = username
        return redirect(url_for('dashboard'))
    else:
        flash('Invalid username or password', 'error')
        return redirect(url_for('index'))

@app.route('/dashboard')
def dashboard():
    if 'username' in session:
        upcoming_tests, active_tests = get_tests()
        return render_template('dashboard.html', 
                                username=session['username'],
                                upcoming_tests=upcoming_tests,
                                active_tests=active_tests
                            )
    else:
        return redirect(url_for('index'))

@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        # Check if the username is already taken
        check_username_query = "SELECT * FROM users WHERE username = %s"
        cursor.execute(check_username_query, (username,))
        existing_user = cursor.fetchone()

        if existing_user:
            flash('Username already taken. Choose a different username.', 'error')
            return redirect(url_for('signup'))

        # Perform signup logic and database operations
        insert_user_query = "INSERT INTO users (username, password, subscription) VALUES (%s, %s, %s)"
        cursor.execute(insert_user_query, (username, password, "False"))
        db.commit()

        flash('Signup successful. Please log in.', 'success')
        return redirect(url_for('index'))

    return render_template('signup.html')

@app.route('/testpaper', methods=['GET', 'POST'])
def testpaper():
    if 'username' in session:
        subscription_query = "SELECT subscription FROM users WHERE username = %s"
        cursor.execute(subscription_query, (session['username'],))
        subscription_status = cursor.fetchone()[0]

        if subscription_status.lower() == 'true':
            cursor.execute("SELECT * FROM questions")
            questions = cursor.fetchall()
            return render_template('testpaper.html', questions=questions)
        else:
            flash('You are not subscribed. Please subscribe to access the test paper.', 'error')
            return render_template('subscribe.html')
    else:
        return redirect(url_for('index'))

@app.route('/submit_test', methods=['POST'])
def submit_test():
    if 'username' in session:
        cursor.execute("SELECT question_id, correct_answer FROM questions")
        correct_answers_data = cursor.fetchall()
        correct_answers = {str(question_id): correct_answer.upper() for question_id, correct_answer in correct_answers_data}

        submitted_answers = {}
        for key, value in request.form.items():
            if key.startswith('q'):
                question_id = key[1:]
                user_answer = value.upper()
                submitted_answers[question_id] = user_answer

        total_questions = len(correct_answers)
        total_score = 0
        correct_answers_count = 0
        unattempted_count = 0

        for question_id, correct_answer in correct_answers.items():
            user_answer = submitted_answers.get(question_id, '')

            if user_answer == '':
                unattempted_count += 1
            elif user_answer == correct_answer:
                correct_answers_count += 1
                total_score += 1

        result_details = {
            'total_score': total_score,
            'correct_answers_count': correct_answers_count,
            'unattempted_count': unattempted_count
        }

        # Record the test attempt
        cursor.execute("""
            INSERT INTO user_test_attempts (username, test_id, attempt_date) 
            VALUES (%s, %s, %s)
        """, (session['username'], None, datetime.now().date()))
        db.commit()

        return render_template('result.html', result_details=result_details)
    else:
        flash('Please log in to submit the test.', 'error')
        return redirect(url_for('index'))

@app.route('/subscribe', methods=['POST'])
def subscribe():
    if 'username' in session:
        payment_method = request.form['payment_method']
        amount = request.form['amount']

        # Update the user's subscription status in the database
        update_subscription_query = "UPDATE users SET subscription = %s WHERE username = %s"
        cursor.execute(update_subscription_query, ("True", session['username']))
        db.commit()

        flash('Subscription successful. You can now access the test paper.', 'success')
        return redirect(url_for('dashboard'))
    else:
        flash('Please log in to subscribe.', 'error')
        return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(debug=True, port=2000)
