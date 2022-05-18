# compare algorithms
from pandas import read_csv
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC

import joblib



# Load dataset
url = "https://raw.githubusercontent.com/jbrownlee/Datasets/master/iris.csv"
names = ['sepal-length', 'sepal-width', 'petal-length', 'petal-width', 'class']
dataset = read_csv(url, names=names)
# Split-out validation dataset
array = dataset.values
X = array[:,0:4]
y = array[:,4]
X_train, X_validation, Y_train, Y_validation = train_test_split(X, y, test_size=0.20, random_state=1, shuffle=True)
# Spot Check Algorithms


model = SVC(gamma='auto')
model.fit(X_train, Y_train)



# Save the model locally
joblib.dump(model, "model.pkl") 



"""
# Load the model
model = joblib.load("model.pkl")
predictions = model.predict([[5.8, 4.0, 1.2, 0.2]])
print(predictions)
"""