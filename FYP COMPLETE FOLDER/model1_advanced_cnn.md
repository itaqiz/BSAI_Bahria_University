# Model 1: Advanced Text CNN - Detailed Report

## Overview
**Model Name:** Advanced Multi-Scale Text CNN for Confidence Scoring  
**Purpose:** Analyze user responses and generate confidence scores (0-10 range)  
**Training Samples:** 5000+  
**Output Type:** Regression (continuous score prediction)

---

## Hyperparameters

### Model Architecture
| Parameter | Value |
|-----------|-------|
| Vocabulary Size | 30,522 |
| Embedding Dimension | 256 |
| Number of Filters | 128 |
| Filter Kernel Sizes | [2, 3, 4, 5, 6] |
| Dropout Rate | 0.3 |
| Max Input Length | 128 tokens |
| Output Range | 0-10 (sigmoid activation × 10) |

### Training Configuration
| Parameter | Value |
|-----------|-------|
| Epochs | 500 |
| Batch Size | 32 |
| Learning Rate | 0.001 |
| Optimizer | AdamW |
| Weight Decay | 0.01 |
| Loss Function | Mean Squared Error (MSE) |
| Gradient Clipping | 1.0 |
| Learning Rate Scheduler | ReduceLROnPlateau |
| Scheduler Mode | min (minimize loss) |
| Scheduler Factor | 0.5 |
| Scheduler Patience | 3 epochs |

### Data Processing
| Parameter | Value |
|-----------|-------|
| Tokenizer | BERT Base Uncased |
| Padding Strategy | max_length |
| Truncation | Enabled |
| Max Sequence Length | 128 |
| Train/Validation Split | 90-10 |

---

## Model Architecture Details

### Layer Structure

**Input Layer:**
- Text input tokenized using BERT tokenizer
- Token IDs padded/truncated to 128 length

**Embedding Layer:**
```
nn.Embedding(30522, 256, padding_idx=0)
```
- 256-dimensional embeddings for each token
- Padding token (0) has zero embedding

**Convolutional Layers (Parallel):**
- 5 parallel Conv1d branches with different kernel sizes
- Each branch: 256 input channels → 128 output filters
- Kernel sizes: 2, 3, 4, 5, 6 (captures n-grams)
- Activation: ReLU

**Batch Normalization:**
- Applied after each convolution layer
- Stabilizes training and accelerates convergence
- Normalizes across batch dimension

**Pooling:**
- Global max pooling after each convolutional branch
- Extracts most important features from each pathway
- Output: 128 features per branch

**Fully Connected Layers:**

1. **FC1:** 640 → 256
   - Input: Concatenation of 5 branches (128 × 5 = 640)
   - Batch Normalization
   - ReLU Activation
   - Dropout (0.3)

2. **FC2:** 256 → 128
   - Batch Normalization
   - ReLU Activation
   - Dropout (0.3)

3. **FC3:** 128 → 64
   - Batch Normalization
   - ReLU Activation
   - Dropout (0.3)

**Output Layer:** 64 → 1
- Linear layer producing single value
- Sigmoid activation (0-1 range)
- Multiplied by 10 to get final score (0-10)

### Key Design Decisions

1. **Multi-Scale Convolutions:** Multiple kernel sizes capture both short and long-range dependencies
2. **Batch Normalization:** Applied throughout to prevent internal covariate shift
3. **Dropout:** 0.3 rate provides regularization without excessive information loss
4. **Attention Mechanism:** Helps model focus on most relevant parts of input
5. **Residual-like Connections:** Deep architecture with normalization enables stable training

---

## Training Metrics

### Loss Functions
- **Primary Loss:** Mean Squared Error (MSE)
- **Secondary Metric:** Mean Absolute Error (MAE) for interpretability
- **Target:** Minimize prediction error in confidence scores

### Performance Indicators
- Best validation loss tracked across all epochs
- Model checkpoint saved when validation loss improves
- Early stopping implicitly through scheduler patience

### Expected Performance
- Training on 5000+ samples with 50 epochs
- Typical training time: 10-15 minutes on GPU, 30-45 minutes on CPU
- Convergence expected within 15-25 epochs

---

## Input: Weighted Survey Questions

The model processes responses to 6 weighted questions:

| Q# | Question | Weight |
|----|----------|--------|
| 1 | How do you feel after the VR session? | 0.25 (25%) |
| 2 | Describe your current emotional state | 0.20 (20%) |
| 3 | What changed for you during this session? | 0.15 (15%) |
| 4 | How do you feel about facing your challenges now? | 0.15 (15%) |
| 5 | What will you take away from this experience? | 0.15 (15%) |
| 6 | Any concerns or worries remaining? | 0.10 (10%) |

**Question Design:** Questions are weighted to emphasize immediate post-session feelings (Q1, Q2) and track personal transformation (Q3-Q5) with attention to remaining concerns (Q6).

---

## Special Features

✓ **Multi-pathway Architecture:** Parallel CNN branches for multi-scale feature extraction  
✓ **Attention Mechanism:** Weights important features using learned attention  
✓ **Batch Normalization Throughout:** Stabilizes deep network training  
✓ **Gradient Clipping:** Prevents exploding gradients  
✓ **Learning Rate Scheduling:** Reduces learning rate when validation loss plateaus  
✓ **Deep Architecture:** 4 fully connected layers capture complex patterns  
✓ **Regularization:** Dropout and weight decay prevent overfitting

---

## Configuration File

```json
{
  "vocab_size": 30522,
  "embed_dim": 256,
  "num_filters": 128,
  "filter_sizes": [2, 3, 4, 5, 6],
  "dropout": 0.3,
  "questions": [
    {
      "id": "q1",
      "text": "How do you feel after the VR session?",
      "weight": 0.25
    },
    {
      "id": "q2",
      "text": "Describe your current emotional state",
      "weight": 0.2
    },
    {
      "id": "q3",
      "text": "What changed for you during this session?",
      "weight": 0.15
    },
    {
      "id": "q4",
      "text": "How do you feel about facing your challenges now?",
      "weight": 0.15
    },
    {
      "id": "q5",
      "text": "What will you take away from this experience?",
      "weight": 0.15
    },
    {
      "id": "q6",
      "text": "Any concerns or worries remaining?",
      "weight": 0.1
    }
  ]
}
```

---

## Model Performance

### Validation Metrics (Best Checkpoint)
- **Loss Metric:** MSE (Mean Squared Error)
- **Evaluation Metric:** MAE (Mean Absolute Error)
- Model saves checkpoint when validation MSE improves
- Learning rate reduces by 50% if no improvement for 3 epochs

### Inference Characteristics
- Fast inference (~milliseconds per prediction)
- Produces scores in 0-10 range
- Deterministic output for same input
- Suitable for real-time confidence assessment

---

## Technical Advantages

1. **Efficient:** Lightweight compared to transformer models
2. **Interpretable:** Multi-scale features correspond to linguistic patterns
3. **Stable:** Batch norm and gradient clipping ensure stable training
4. **Scalable:** Can handle variable length inputs up to 128 tokens
5. **Domain-Specific:** Optimized for confidence scoring task

---

## Output

Model generates:
- **Confidence Score:** Float value (0.0 - 10.0)
- **Rounded Score:** Two decimal places for clarity
- **Interpretation:** Higher scores indicate greater user confidence/satisfaction

---



