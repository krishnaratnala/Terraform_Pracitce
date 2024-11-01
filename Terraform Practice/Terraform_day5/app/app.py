from flask import Flask
app=Flask(__name__)
@app.route("/")
def hello():
    return "hello this is krishna new project"


if  __name__=="--main__":
    app.run(host="0.0.0.0",por=80)