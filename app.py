from flask import Flask
import os
app = Flask(__name__)

@app.route("/")
def hello():
    get_val = os.environ.get('test_var', 'error')
    get_other_val = os.environ.get('other_var', 'error')
    return f"Hello World! - {get_val} - {get_other_val}"