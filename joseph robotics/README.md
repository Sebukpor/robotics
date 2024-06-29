# Predicting End-Effector Positions

This repository contains a deep learning model to predict the positions of a robot's end-effector based on its joint angles and rotation elements. The model is implemented using TensorFlow and Keras, and it utilizes a neural network to perform regression on the input data.

## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Dependencies](#dependencies)
- [Model Training and Evaluation](#model-training-and-evaluation)
- [License](#license)

## Installation

To install the necessary dependencies for this project, you can use the provided package installation commands.

1. **Clone the repository:**

    ```bash
    git clone https://github.com/yourusername/predicting-end-effector-positions.git
    cd predicting-end-effector-positions
    ```

2. **Install Python packages:**

    ```bash
    pip install tensorflow pandas numpy scikit-learn
    ```

## Usage

To run the end-effector position prediction model, follow these steps:

1. **Prepare the dataset:**

    Ensure you have a CSV file containing the joint angles, rotation elements, and end-effector positions. The CSV file should have the following columns:
    - `JointAngle1`, `JointAngle2`, `JointAngle3`, `JointAngle4`, `JointAngle5`, `JointAngle6`
    - `X_Position`, `Y_Position`, `Z_Position`
    - `RotationElement1`, `RotationElement2`, `RotationElement3`

2. **Run the model script:**

    ```bash
    python predicting_end_effector_positions.py
    ```

    The script will load the dataset, preprocess the data, train the model, and save the trained model.

3. **Predict end-effector positions:**

    The script includes a function to predict end-effector positions based on user input. Adjust the input data and run the script to make predictions.

## Project Structure

- `predicting_end_effector_positions.py`: Main script containing the model and data processing logic.
- `README.md`: This README file.

## Dependencies

The project requires the following dependencies:

- tensorflow
- pandas
- numpy
- scikit-learn

## Model Training and Evaluation

The end-effector position prediction model is trained using the following steps:

1. **Data Loading:** Loading the dataset from a CSV file.
2. **Data Preprocessing:** Scaling and normalizing the input data.
3. **Model Definition:** Defining a neural network model using TensorFlow and Keras.
4. **Model Training:** Training the model using the preprocessed data.
5. **Model Evaluation:** Printing the final training and validation mean absolute error (MAE).

To train and evaluate the model, the script will:

- Load the dataset from a specified file.
- Preprocess the input data.
- Train the neural network model using the training set.
- Evaluate the model using the validation set.
- Print the final training and validation MAE.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Feel free to contribute to this project by creating issues or pull requests.
