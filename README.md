# ML_HW1 - Machine Learning Homework 1

## Overview

This project was completed for a Machine Learning course in 2017.

The homework focuses on fundamental machine learning concepts and classical regression methods, including:

- Jensen's Inequality
- Gaussian Entropy
- KL Divergence between Gaussian distributions
- Polynomial Curve Fitting
- Regularized Linear Regression
- Polynomial Regression on the Iris dataset

Most programming parts were implemented in MATLAB, without relying on high-level machine learning toolboxes.

---

# Part 1 — Mathematical Foundations

## 1. Jensen's Inequality

The first problem focuses on proving Jensen's Inequality for convex functions using induction.

This part helped reinforce the mathematical foundation behind many machine learning optimization concepts, especially convexity and expectation-based inequalities.

---

## 2. Entropy of a Gaussian Distribution

The second problem derives the entropy of a univariate Gaussian distribution.

Key concept:

```text
H[x] = 1/2 * (1 + ln(2πσ²))
```

This is an important foundation for probabilistic machine learning, information theory, and model uncertainty.

---

## 3. KL Divergence between Two Gaussian Distributions

The third problem derives the KL divergence between two Gaussian distributions.

This concept is widely used in:

- Probabilistic modeling
- Bayesian inference
- Variational inference
- Generative models such as VAE

---

# Part 2 — Polynomial Curve Fitting

## Objective

Implement polynomial regression from scratch and analyze the effect of model complexity.

The model form is:

```text
y(x, w) = w0 + w1x + w2x² + ... + wMx^M
```

The goal is to fit training data using different polynomial orders and evaluate both training and testing error.

---

## Files

```text
4/no4.m
4/hass3.m
4/4_train.csv
4/4_test.csv
```

---

## Implementation Details

### Polynomial Feature Construction

The code manually constructs a Vandermonde-style feature matrix:

```matlab
V = ones(length(x), n + 1);

for j = 1:n
    V(:, j+1) = V(:, j) .* x;
end
```

This converts one-dimensional input data into polynomial features.

---

### Weight Estimation

The regression weights are solved using the closed-form least squares solution:

```matlab
w = pinv((V') * V) * (V') * t;
```

This implements linear regression directly using matrix operations.

---

### RMS Error Evaluation

Training and testing errors are evaluated using Root Mean Square Error:

```text
E_RMS = sqrt( mean((prediction - target)^2) )
```

The code computes RMS error on both:

- Training set
- Test set

---

## Model Complexity Experiment

The program evaluates polynomial orders from:

```text
M = 1 to 9
```

and plots:

- Training error
- Test error

This experiment demonstrates the relationship between model complexity and overfitting.

---

## Overfitting Observation

From the homework result:

```text
When M = 7, 8, 9:
training error becomes low,
but test error becomes high.
```

This indicates overfitting.

The model becomes too complex and starts fitting noise in the training data rather than learning the general pattern.

---

## Regularization Experiment

The homework also applies L2 regularization to the polynomial model with:

```text
M = 9
```

and varies:

```text
ln(lambda) from -20 to 0
```

The regularized objective is:

```text
E(w) = data_error + lambda * ||w||²
```

This experiment shows how regularization reduces overfitting by penalizing large weights.

---

# Part 3 — Polynomial Regression on Iris Dataset

## Objective

Apply polynomial regression to a multi-dimensional dataset.

The Iris dataset contains:

- 150 samples
- 4 input features
- 3 classes

Input features:

1. Sepal length
2. Sepal width
3. Petal length
4. Petal width

Target:

```text
Iris class label
```

---

## Files

```text
5/no5.m
5/hass.m
5/hass2.m
5/5_X.mat
5/5_T.mat
```

---

## Dataset Split

The dataset contains 3 classes, each with 50 samples.

The code manually splits the dataset:

```text
First 40 samples of each class  → training set
Last 10 samples of each class   → test set
```

Total:

```text
Training set: 120 samples
Test set: 30 samples
```

---

## Polynomial Feature Construction

Two regression settings are tested:

### Order 1

Uses linear features:

```text
1, x1, x2, x3, x4
```

### Order 2

Uses both linear and second-order interaction features:

```text
1, x1, x2, x3, x4,
x1x1, x1x2, ..., x4x4
```

The second-order feature matrix is manually constructed in MATLAB.

---

## Model Training

The model is trained using the closed-form least squares solution:

```matlab
w = pinv((V') * V) * (V') * target;
```

Both first-order and second-order polynomial regression models are evaluated.

---

## Results

From the homework report:

```text
M = 1
Training RMSE: 0.2263
Test RMSE:     0.1711

M = 2
Training RMSE: 0.1886
Test RMSE:     0.1532
```

The second-order polynomial model achieved lower error, showing that interaction terms improved the regression result.

---

## Feature Contribution Analysis

The code also removes one feature at a time to observe the effect on error.

Reported results:

```text
Remove x1: 0.2099
Remove x2: 0.2088
Remove x3: 0.2253
Remove x4: 0.2138
```

This was used to estimate the relative contribution of each feature.

---

# Additional Experiment — Logistic Basis Function Regression

## File

```text
v22.m
logis1.m
```

This part implements regression using logistic basis functions.

The code constructs basis functions using:

```matlab
logis1((x - center) / scale)
```

where `logis1.m` defines the logistic sigmoid function:

```matlab
logis = 1 / (1 + exp(-a))
```

The model then solves the weights using matrix pseudo-inverse.

This experiment explores nonlinear feature transformation beyond simple polynomial basis functions.

---

# Repository Structure

```text
ML_HW1-main/
├── README.md
└── [2017]ML_HW1/
    ├── Introduction to Machine Learning Homework.pdf
    ├── [2017]ML_HW1.pdf
    ├── HW1_0660298_謝益宏.docx
    ├── 1_data.mat
    ├── 2_data.mat
    ├── logis1.m
    ├── v21.m
    ├── v22.m
    ├── train.csv
    ├── test.csv
    │
    ├── 4/
    │   ├── 4_train.csv
    │   ├── 4_test.csv
    │   ├── no4.m
    │   └── hass3.m
    │
    ├── 5/
    │   ├── 5_X.mat
    │   ├── 5_T.mat
    │   ├── no5.m
    │   ├── hass.m
    │   └── hass2.m
    │
    └── data/
        ├── 4_train.csv
        ├── 4_test.csv
        ├── 5_X.mat
        └── 5_T.mat
```

---

# Skills Demonstrated

## Machine Learning

- Linear Regression
- Polynomial Regression
- Regularization
- Overfitting Analysis
- RMS Error Evaluation
- Feature Contribution Analysis

## Mathematical Foundations

- Jensen's Inequality
- Entropy
- KL Divergence
- Gaussian Distributions
- Convexity

## Programming

- MATLAB Matrix Operations
- Manual Feature Engineering
- Closed-form Least Squares Solution
- Data Visualization
- Error Curve Plotting

---

# What I Learned

Through this homework, I practiced both the mathematical and programming foundations of machine learning.

The most important takeaways were:

- How model complexity affects overfitting
- How regularization improves generalization
- How polynomial features can model nonlinear relationships
- How to solve linear regression using matrix operations
- How to evaluate models using training and testing error
- How to analyze feature importance through feature removal

This project helped build the foundation for later deep learning and machine learning projects.
