# -*- coding: utf-8 -*-
"""
Examples for regression using regression trees, linear regression and 
RBF Kernel Ridge Regression
"""
print(__doc__)
import numpy as np
import random
import matplotlib.pyplot as plt
from sklearn.pipeline import make_pipeline
from sklearn.preprocessing import PolynomialFeatures
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import cross_val_score
from sklearn.tree import DecisionTreeRegressor
from sklearn import tree
from sklearn.base import BaseEstimator, TransformerMixin
from sklearn.metrics import mean_absolute_error
from sklearn.metrics import mean_squared_error

import seaborn as sns
import graphviz 

def visualizeTree(clf, name):
    dot_data = tree.export_graphviz(clf, out_file=name+".dot") 
    #graph = graphviz.Source(dot_data) 
    #graph.render(name) 
    
def true_func(X):
    return np.cos(1.5 * np.pi * X)
    #return np.cos(4 * np.pi * X)
    #arg= (X - (X.max()-X.min())/2)/(0.1*(X.max()-X.min()))
    #return np.exp(-0.5 * np.sum(arg ** 2, 1))

def sampled_func(X):
    val = true_func(X)
    return val+(0.5*(random.random()-0.25)*val)

def TrainPredictRegressionTrees(X, y_true, y_sampled):
    regr_1 = DecisionTreeRegressor(max_depth=2)
    regr_2 = DecisionTreeRegressor(max_depth=5)
    regr_3 = DecisionTreeRegressor(max_depth=11)
    regr_1.fit(X, y_sampled)
    regr_2.fit(X, y_sampled)
    regr_3.fit(X, y_sampled)
    # 
    # # Predict
    X_test = np.sort(np.random.rand(n_samples), axis=0)
    X_test = X.reshape(n_samples, 1)
    #X_test = np.arange(0.0, 1.0, 0.01)[:, np.newaxis]
    y_1 = regr_1.predict(X_test)
    y_2 = regr_2.predict(X_test)
    y_3 = regr_3.predict(X_test)
    y_1_mse =  mean_squared_error(y_true, y_1)
    y_1_mae = mean_absolute_error(y_true, y_1)
    
    y_2_mse =  mean_squared_error(y_true, y_2)
    y_2_mae = mean_absolute_error(y_true, y_2)
    
    y_3_mse =  mean_squared_error(y_true, y_3)
    y_3_mae = mean_absolute_error(y_true, y_3)
    
    # Plot the results
    plt.figure()
    plt.scatter(X, y_sampled, s=20, edgecolor="black",
                c="darkorange", label="sampled")
    plt.scatter(X, y_true, s=20, edgecolor="black",
                c="yellow", label="true")
    plt.plot(X_test, y_1, color="cornflowerblue",
             label="max_depth=2", linewidth=2)
    plt.plot(X_test, y_2, color="yellowgreen", label="max_depth=5", linewidth=2)
    plt.plot(X_test, y_3, color="red", label="max_depth=11", linewidth=2)
    plt.xlabel("x")
    plt.ylabel("y")
    plt.title("Decision Tree Regression")
    #plt.title("Degree {}\nMSE = {:.2e}(+/- {:.2e})".format(
    #        1, -scores.mean(), scores.std()))
    plt.legend()
    plt.show()
    
    print("MSE:")
    print("y_1 mse = ", y_1_mse)
    print("y_2 mse = ", y_2_mse)
    print("y_3 mse = ", y_3_mse)
    
    print("MAE:")
    print("y_1 mae = ", y_1_mae)
    print("y_2 mae = ", y_2_mae)
    print("y_3 mae = ", y_3_mae)
    
    visualizeTree(regr_1, "T2")
    visualizeTree(regr_2, "T5")
    visualizeTree(regr_3, "T11")  
    
def TrainPredictLinearRegression(X, y_true, y_sampled):
    # Create linear regression object
    regr = LinearRegression()
    # Train the model using the training sets
    regr.fit(X, y_sampled)
    X_test = np.sort(np.random.rand(n_samples), axis=0)
    X_test = X.reshape(n_samples, 1)
    y_pred = regr.predict(X_test)
     # Plot the results
    plt.figure()
    plt.scatter(X, y_sampled, s=20, edgecolor="black",
                c="darkorange", label="sampled")
    plt.scatter(X, y_true, s=20, edgecolor="black",
                c="yellow", label="true")
    plt.plot(X_test, y_pred, color="cornflowerblue",
             label="linear Regr", linewidth=2)
    plt.xlabel("x")
    plt.ylabel("y")
    plt.title("Linear Regression")

    plt.legend()
    plt.show()


class GaussianFeatures(BaseEstimator, TransformerMixin):
    """
    Transforms a given interval from the one-dimensional input space X
    into a uniformly spaced Gaussian features distribution.
    The X must be an np.array-like in rows first shape X.shape(n_samples, 1)
    see: https://github.com/jakevdp/PythonDataScienceHandbook/blob/master/notebooks/05.06-Linear-Regression.ipynb
         for more details on kernel definition (code was partially taken from there)
    """
    
    def __init__(self, N, width_factor=2.0):
        if (N<2):
            raise ValueError("Number of Gaussian Kernels must be at least 2")
        self.N = N # N is the number of kernels
        self.width_factor = width_factor # the width of the kernel
    
    @staticmethod
    def _gauss_basis(x, y, width, axis=None):
        # effectively computes 1/2*exp(SUM_i(x_i-center)^2/width^2) 
        # where x_i is a feature in a sample vector x
        # hence the gaussian kernel is placed at center position y in 
        # every dimension having identical std_dev in every dimension
        arg = (x - y) / width
        return np.exp(-0.5 * np.sum(arg ** 2, axis))
        
    def fit(self, X, y=None):
        # create N centers spread along the data range
        self.centers_ = np.linspace(X.min(), X.max(), self.N)
        print(self.centers_)
        # scale std deviation of gaussian kernels according to distance between kernels
        self.width_ = self.width_factor * (self.centers_[1] - self.centers_[0])
        return self
        
    def transform(self, X):
        # transforms the 2D festure matrix into a 3D matrix
        return self._gauss_basis(X[:, :, np.newaxis], self.centers_,
                                 self.width_, axis=1)
        
       
def TrainPolynomial(X, y_true, y_sampled):
    # Create linear regression object
    regrLin = make_pipeline(PolynomialFeatures(7), LinearRegression())
    regrRBF = make_pipeline(GaussianFeatures(7), LinearRegression())

    # Train the model using the training sets
    
    # this is a polynomial fit
    regrLin.fit(X, y_sampled)
    X_test = np.sort(np.random.rand(n_samples), axis=0)
    X_test = X.reshape(n_samples, 1)
    y_pred_Lin = regrLin.predict(X_test)
    
    # this is a fit with radial basis functions
    regrRBF.fit(X, y_sampled)
    X_test = np.sort(np.random.rand(n_samples), axis=0)
    X_test = X.reshape(n_samples, 1)
    y_pred_RBF = regrRBF.predict(X_test)


     # Plot the results
    plt.figure()
    plt.scatter(X, y_sampled, s=20, edgecolor="black",
                c="darkorange", label="sampled")
    plt.scatter(X, y_true, s=20, edgecolor="black",
                c="yellow", label="true")
    plt.plot(X_test, y_pred_Lin, color="cornflowerblue",
             label="PolyLin", linewidth=2)
    plt.plot(X_test, y_pred_RBF, color="yellow",
             label="GaussRBFLin", linewidth=2)
    plt.xlabel("x")
    plt.ylabel("y")
    plt.title("Polynomial Regression")

    plt.legend()
    plt.show()
    y_mse_Lin =  mean_squared_error(y_true, y_pred_Lin)
    y_mae_Lin =  mean_absolute_error(y_true, y_pred_Lin)
    y_mse_RBF =  mean_squared_error(y_true, y_pred_RBF)
    y_mae_RBF =  mean_absolute_error(y_true, y_pred_RBF)
    print("Polynomial")
    print("mse = ", y_mse_Lin)
    print("mae = ", y_mae_Lin)
    print("\nRBF (Gaussian)")
    print("mse = ", y_mse_RBF)
    print("mae = ", y_mae_RBF)
    
   
sns.set()

np.random.seed(0)

n_samples = 80
X = np.sort(np.random.rand(n_samples), axis=0)
X = X.reshape(n_samples, 1)
y_true = true_func(X)
y_sampled = sampled_func(X).ravel()

# =============================================================================
# Fit regression model

#TrainPredictLinearRegression(X, y_true, y_sampled)
#TrainPredictRegressionTrees(X, y_true, y_sampled)
TrainPolynomial(X, y_true, y_sampled)
# =============================================================================

 # Plot the raw data results
#plt.figure()
#plt.scatter(X, y_sampled, s=20, edgecolor="black",
#            c="darkorange", label="sampled")
#plt.scatter(X, y_true, s=20, edgecolor="black",
#            c="yellow", label="true")

#plt.xlabel("x")
#plt.ylabel("y")
#plt.title("Tree Regression")