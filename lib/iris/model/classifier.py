import os


import joblib
def load_model():
    path = os.path.abspath('lib/iris/model/model.pkl')
    return joblib.load(path)  

def predict_model(args):
    iris_classifier = load_model()
    return iris_classifier.predict([args])[0]