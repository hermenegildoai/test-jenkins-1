from flask import Flask
app = Flask(__name__)

def suma(a, b):
    return a + b

@app.route('/')
def hello_world():
    res = suma(2,5)
    return 'Hello, World %s! ' % (res)

if __name__ == "__main__":
    app.run("0.0.0.0", port=5000)
