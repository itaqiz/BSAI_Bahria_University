# Bahria University, Islamabad Campus
## Department of Computer Sciences
### Artificial Neural Network — Class Assignment 3

---

**Name:** Muhammad Taqui
**Enrollment-ID:** 01-136221-021
**Class:** BS-AI (6A)

---

## Q1: Design a neural network using Hebbian Learning Rule for Pattern 1 and Pattern 2.

### Patterns

| Input | Pattern 1 | Pattern 2 |
|-------|-----------|-----------|
| n1    | +         | +         |
| n2    | +         | +         |
| n3    | +         | +         |
| n4    | -         | +         |
| n5    | +         | -         |
| n6    | -         | +         |
| n7    | +         | +         |
| n8    | +         | +         |
| n9    | +         | +         |
| b     | 1         | 1         |
| t     | 1         | -1        |

---

### Solution

**Hebbian Learning Rule:**

$$w_i(\text{new}) = w_i(\text{old}) + n_i \cdot y$$

**Initialize:** all weights $w_{1-9} = 0$, bias $b = 0$

---

### Case 1: Pattern 1 — target = 1

$$w_i(\text{new}) = 0 + n_i \cdot y$$

| Weight | Calculation         | Result |
|--------|---------------------|--------|
| w1     | 0 + 1×1             | 1      |
| w2     | 0 + 1×1             | 1      |
| w3     | 0 + 1×1             | 1      |
| w4     | 0 + 1×(−1)          | −1     |
| w5     | 0 + 1×1             | 1      |
| w6     | 0 + 1×(−1)          | −1     |
| w7     | 0 + 1×1             | 1      |
| w8     | 0 + 1×1             | 1      |
| w9     | 0 + 1×1             | 1      |
| b      | 0 + 1               | 1      |

$$W_\text{new} = [1, 1, 1, -1, 1, -1, 1, 1, 1]$$

---

### Case 2: Presenting Pattern 0 — target = −1

Weights used here are the **final weights obtained after Pattern 1.**

$$w_i(\text{new}) = w_i(\text{old}) + n_i \cdot y$$

| Weight | Calculation         | Result |
|--------|---------------------|--------|
| w1     | 1 + 1×(−1)          | 0      |
| w2     | 1 + 1×(−1)          | 0      |
| w3     | 1 + 1×(−1)          | 0      |
| w4     | −1 + 1×(−1)         | −2     |
| w5     | 1 + (−1)×(−1)       | 2      |
| w6     | −1 + (1)×(−1)       | −2     |
| w7     | 1 + 1×(−1)          | 0      |
| w8     | 1 + 1×(−1)          | 0      |
| w9     | 1 + 1×(−1)          | 0      |
| b      | 1 + (−1)            | 0      |

$$W_\text{final} = [0, 0, 0, -2, 2, -2, 0, 0, 0]$$

---

### Architecture After Final Training

```
          b (bias=0)
          |
   n1 ── w1=0 ──┐
   n2 ── w2=0 ──┤
   n3 ── w3=0 ──┤
   n4 ── w4=-2 ─┤
   n5 ── w5=2  ─┼──► [Σ] ──► y
   n6 ── w6=-2 ─┤
   n7 ── w7=0 ──┤
   n8 ── w8=0 ──┤
   n9 ── w9=0 ──┘
```

---

## Q2: NOR Gate — Hebbian Learning (when O2 = −1)

### Truth Table

| n1 | n2 | y  |
|----|----|----|
| −1 | −1 | 1  |
| −1 | 1  | −1 |
| 1  | −1 | −1 |
| 1  | 1  | −1 |

---

### Solution

**Initialize:** $w_1 = w_2 = 0$, $b = 0$

---

**Input 1:** $[-1, -1]$, target $= 1$

$$w_1(\text{new}) = 0 + (-1)(1) = -1$$
$$w_2(\text{new}) = 0 + (-1)(1) = -1$$

---

**Input 2:** $[-1, 1]$, target $= -1$

$$w_1(\text{new}) = -1 + (-1)(-1) = 0$$
$$w_2(\text{new}) = -1 + 1(-1) = -2$$

---

**Input 3:** $[1, -1]$, target $= -1$

$$w_1(\text{new}) = 0 + 1(-1) = -1$$
$$w_2(\text{new}) = -2 + (-1)(-1) = -1$$

---

**Input 4:** $[1, 1]$, target $= -1$

$$w_1(\text{new}) = -1 + 1(-1) = -2$$
$$w_2(\text{new}) = -1 + 1(-1) = -2$$

---

### Final Weights

$$W_\text{final} = [-2, -2]$$

**Verification:**

| n1 | n2 | $w_1 x_1 + w_2 x_2$           | Result | Sign |
|----|----|-------------------------------|--------|------|
| −1 | −1 | $-1(-1) + (-1)(-1) = 2$       | 2 > 0  | 1 ✓  |
| −1 | 1  | $-1(0) + 1(-2) = -2$          | −2 < 0 | −1 ✓ |
| 1  | −1 | $-1(1) + (-1)(-1) = 0$        | 0      | −1 ✓ |
| 1  | 1  | $-2(1) + (-2)(1) = -4$        | −4 < 0 | −1 ✓ |

**NOR Gate successfully learned using Hebbian Learning Rule.**

---

### Final Architecture

```
   n1 ── w1=−2 ──┐
                  ├──► [Σ] ──► y
   n2 ── w2=−2 ──┘
```

<!-- iTaqiZ - PK -->
