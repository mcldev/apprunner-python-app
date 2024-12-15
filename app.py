from flask import Flask
import os
app = Flask(__name__)

@app.route("/")
def hello():
    get_val = os.environ.get('test_var', 'error')
    return f"Hello World! - {get_val}"