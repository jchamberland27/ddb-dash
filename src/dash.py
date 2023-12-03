#!/usr/bin/python3

from flask import Flask, request, render_template
from flask_socketio import SocketIO
import json

app = Flask(__name__)
socketio = SocketIO(app)

@app.route('/')
def display_ui():
    """Display the UI for the Deck Roller."""
    return render_template('index.html')

@app.route('/ping')
def ping():
    return 'PONG'

#Start app
if __name__ == '__main__':
    socketio.run(app, debug=True, host='0.0.0.0')