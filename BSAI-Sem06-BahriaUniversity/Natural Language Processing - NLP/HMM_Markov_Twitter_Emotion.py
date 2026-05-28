# ============================================================
# Name         : Muhammad Taqui
# Enrollment   : 01-136221-021
# Class        : BS-AI (6A)
# Submitted To : Sir Sohail Akhtar
# Task         : Hidden Markov Model — Twitter Emotion Dataset
#                (MLE Transition Matrix + Sequence Probabilities)
# Dataset      : https://www.kaggle.com/code/shtrausslearning/
#                twitter-emotion-classification/input?select=training.csv
# ============================================================

import pandas as pd

# ── Load Dataset ──────────────────────────────────────────────────────────────

data = pd.read_csv("training.csv")

# Map numeric labels to emotion strings
label_mapping = {
    0: 'sadness',
    1: 'joy',
    2: 'love',
    3: 'anger',
    4: 'fear',
    5: 'Neutral'
}
data['label'] = data['label'].map(label_mapping)


# ── 1. Transition Matrix via MLE ──────────────────────────────────────────────

def create_transition_matrix(df):
    """
    Builds a transition matrix using Maximum Likelihood Estimation (MLE).
    Each cell T[i][j] = count(i -> j) / sum(count(i -> *))
    Laplace smoothing (+1) applied to avoid zero probabilities.
    """
    states = df['label'].unique()
    transition_matrix = pd.DataFrame(index=states, columns=states, data=0)

    for i in range(len(df) - 1):
        transition_matrix.loc[df['label'].iloc[i], df['label'].iloc[i + 1]] += 1

    # Normalize (with +1 smoothing)
    transition_matrix = transition_matrix.div(
        transition_matrix.sum(axis=1) + 1, axis=0
    )
    return transition_matrix


transition_matrix = create_transition_matrix(data)


# ── 2. Initial Probabilities ──────────────────────────────────────────────────

def calculate_initial_probabilities(df):
    """
    Computes the initial state distribution π(s) = count(s) / total.
    """
    return df['label'].value_counts(normalize=True)


initial_probabilities = calculate_initial_probabilities(data)

print("=" * 60)
print("TRANSITION MATRIX (MLE)")
print("=" * 60)
print(transition_matrix)

print("\n" + "=" * 60)
print("INITIAL PROBABILITIES")
print("=" * 60)
print(initial_probabilities)


# ── 3. Sequence Probability Calculator ───────────────────────────────────────

def calculate_sequence_probability(sequence, transition_matrix, initial_probabilities):
    """
    P(s1, s2, ..., sn) = π(s1) * T(s1→s2) * T(s2→s3) * ... * T(s(n-1)→sn)
    """
    if sequence[0] not in initial_probabilities:
        return 0

    probability = initial_probabilities[sequence[0]]
    for i in range(len(sequence) - 1):
        probability *= transition_matrix.loc[sequence[i], sequence[i + 1]]

    return probability


# ── Observable Sequences ──────────────────────────────────────────────────────

sequence1 = ['sadness', 'joy',   'love']
sequence2 = ['anger',   'fear',  'sadness']
sequence3 = ['joy',     'anger', 'joy']

prob1 = calculate_sequence_probability(sequence1, transition_matrix, initial_probabilities)
prob2 = calculate_sequence_probability(sequence2, transition_matrix, initial_probabilities)
prob3 = calculate_sequence_probability(sequence3, transition_matrix, initial_probabilities)

print("\n" + "=" * 60)
print("SEQUENCE PROBABILITIES")
print("=" * 60)
print(f"Sequence 1 {sequence1}: {prob1:.6f}")
print(f"Sequence 2 {sequence2}: {prob2:.6f}")
print(f"Sequence 3 {sequence3}: {prob3:.6f}")

# ── Expected Output ───────────────────────────────────────────────────────────
# Sequence 1: ~0.007616
# Sequence 2: ~0.005110
# Sequence 3: ~0.015629

# iTaqiZ - PK
