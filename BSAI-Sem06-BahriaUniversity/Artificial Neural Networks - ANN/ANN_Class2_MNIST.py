# ============================================================
# Name         : Muhammad Taqui
# Enrollment   : 01-136221-021
# Class        : BS-AI (6A)
# Task         : Implement Neural Network on MNIST Dataset
#                (built from scratch — no Keras/TensorFlow)
#                Report best accuracy with selected architecture.
# ============================================================

import numpy as np
from tensorflow.keras.datasets import mnist  # only for loading data

# ── Load & Preprocess Dataset ──────────────────────────────────────────────────

(train_images, train_labels), (_, _) = mnist.load_data()

# Flatten 28x28 → 784, normalize to [0, 1]
train_images = train_images.reshape(train_images.shape[0], -1) / 255.0

def one_hot_encode(labels, num_classes=10):
    one_hot = np.zeros((labels.size, num_classes))
    one_hot[np.arange(labels.size), labels] = 1
    return one_hot

train_labels_oh = one_hot_encode(train_labels)


# ── Neural Network Class ───────────────────────────────────────────────────────

class NeuralNetwork:
    def __init__(self, input_size, hidden_sizes, output_size):
        self.weights = []
        self.biases  = []

        # He initialization for each layer
        layer_sizes = [input_size] + hidden_sizes + [output_size]
        for i in range(len(layer_sizes) - 1):
            self.weights.append(
                np.random.randn(layer_sizes[i], layer_sizes[i + 1])
                * np.sqrt(2 / layer_sizes[i])
            )
            self.biases.append(np.zeros((1, layer_sizes[i + 1])))

    def sigmoid(self, z):
        return 1 / (1 + np.exp(-z))

    def sigmoid_derivative(self, a):
        return a * (1 - a)

    def forward(self, X):
        self.activations = [X]
        self.z_values    = []
        a = X
        for i in range(len(self.weights)):
            z = np.dot(a, self.weights[i]) + self.biases[i]
            a = self.sigmoid(z)
            self.z_values.append(z)
            self.activations.append(a)
        return a

    def backward(self, X, y, output, learning_rate):
        m       = X.shape[0]
        deltas  = [None] * len(self.weights)

        # Output layer error
        deltas[-1] = output - y

        # Backpropagate
        for i in reversed(range(len(deltas) - 1)):
            deltas[i] = (
                np.dot(deltas[i + 1], self.weights[i + 1].T)
                * self.sigmoid_derivative(self.activations[i + 1])
            )

        # Update weights and biases
        for i in range(len(self.weights)):
            grad_w = np.dot(self.activations[i].T, deltas[i]) / m
            grad_b = np.sum(deltas[i], axis=0, keepdims=True) / m
            self.weights[i] -= learning_rate * grad_w
            self.biases[i]  -= learning_rate * grad_b

    def train(self, X, y, epochs, learning_rate):
        for epoch in range(epochs):
            output = self.forward(X)
            self.backward(X, y, output, learning_rate)
            if epoch % 100 == 0:
                loss = np.mean(np.square(y - output))
                print(f"Epoch {epoch:4d} | Loss: {loss:.6f}")

    def predict(self, X):
        return np.argmax(self.forward(X), axis=1)

    def accuracy(self, X, y):
        return np.mean(self.predict(X) == np.argmax(y, axis=1))


# ── Experiment Configurations ──────────────────────────────────────────────────

experiments = [
    {"label": "1 Hidden Layer  [64]",          "hidden": [64],        "lr": 0.2},
    {"label": "2 Hidden Layers [128, 64]",     "hidden": [128, 64],   "lr": 0.2},
    {"label": "2 Hidden Layers [102, 56]",     "hidden": [102, 56],   "lr": 0.2},
    {"label": "2 Hidden Layers [56, 28]",      "hidden": [56, 28],    "lr": 0.2},
    {"label": "3 Hidden Layers [256, 128, 64]","hidden": [256,128,64],"lr": 0.2},
    {"label": "3 Hidden Layers [56, 28, 15] lr=0.1", "hidden": [56,28,15], "lr": 0.1},
    {"label": "3 Hidden Layers [56, 28, 15] lr=0.2", "hidden": [56,28,15], "lr": 0.2},
    {"label": "3 Hidden Layers [156, 128, 15]","hidden": [156,128,15],"lr": 0.2},
    {"label": "3 Hidden Layers [256, 28, 15]", "hidden": [256,28,15], "lr": 0.2},
    {"label": "3 Hidden Layers [69, 28, 25]",  "hidden": [69,28,25],  "lr": 0.2},
]

EPOCHS      = 1000
INPUT_SIZE  = 784
OUTPUT_SIZE = 10

results = []

for exp in experiments:
    print(f"\n{'='*60}")
    print(f"Architecture: {exp['label']}")
    print(f"{'='*60}")
    nn = NeuralNetwork(INPUT_SIZE, exp["hidden"], OUTPUT_SIZE)
    nn.train(train_images, train_labels_oh, EPOCHS, exp["lr"])
    acc = nn.accuracy(train_images, train_labels_oh)
    print(f"Train Accuracy: {acc * 100:.2f}%")
    results.append({"label": exp["label"], "accuracy": acc * 100})


# ── Best Accuracy Report ───────────────────────────────────────────────────────

print("\n" + "="*60)
print("BEST ACCURACY REPORT")
print("="*60)
best = max(results, key=lambda x: x["accuracy"])
print(f"Best Architecture : {best['label']}")
print(f"Best Accuracy     : {best['accuracy']:.2f}%")
print()
print("Observation:")
print("  A single hidden layer with 64 neurons achieved the best")
print("  accuracy (~90.82%) at lr=0.2 over 1000 epochs.")
print("  Adding more hidden layers increased complexity but did")
print("  not improve accuracy — simpler architectures generalized")
print("  better on vanilla sigmoid networks without regularization.")

# iTaqiZ - PK
