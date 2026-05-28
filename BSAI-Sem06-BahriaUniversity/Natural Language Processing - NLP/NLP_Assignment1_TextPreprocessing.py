# ============================================================
# Name         : Muhammad Taqui
# Enrollment   : 01-136221-021
# Class        : BS-AI (6A)
# Assignment   : NLP Assignment 1
# Task         : Text Preprocessing on SMS Spam Dataset
#                (Stop Words, Stemming, Lemmatization, Tokenization)
# Dataset      : https://www.kaggle.com/datasets/uciml/
#                sms-spam-collection-dataset
# ============================================================

import pandas as pd
import nltk
from nltk.corpus import corpus
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer, LancasterStemmer, SnowballStemmer
from nltk.stem import WordNetLemmatizer

nltk.download('stopwords')
nltk.download('wordnet')

# ── Load Dataset ──────────────────────────────────────────────────────────────

df = pd.read_csv('spam.csv', encoding='ISO-8859-1')
df = df[['v1', 'v2']]
df.columns = ['label', 'text']

print("Dataset shape:", df.shape)
print(df.head())


# ── 1. Remove Standard Stop Words ────────────────────────────────────────────

stop_words = set(stopwords.words('english'))

def remove_stopwords(text):
    """Removes NLTK English stop words from text."""
    return " ".join([
        word for word in text.split()
        if word.lower() not in stop_words
    ])

df['text_no_stopwords'] = df['text'].apply(remove_stopwords)

print("\n── After Stop Word Removal ──")
print(df[['label', 'text', 'text_no_stopwords']].head())


# ── 2. Remove Custom Stop Words ──────────────────────────────────────────────

custom_stop_words = {'ur', 'u', '2'}
stop_words.update(custom_stop_words)

df['text_no_custom_stopwords'] = df['text'].apply(remove_stopwords)

print("\n── After Custom Stop Word Removal ──")
print(df[['label', 'text', 'text_no_custom_stopwords']].head())


# ── 3. Stemming — Porter Stemmer ─────────────────────────────────────────────

porter_stemmer = PorterStemmer()

def porter_stemming(text):
    """Applies Porter Stemmer to each word in text."""
    return " ".join([porter_stemmer.stem(word) for word in text.split()])

df['text_porter_stemmed'] = df['text_no_custom_stopwords'].apply(porter_stemming)

print("\n── After Porter Stemming ──")
print(df[['label', 'text', 'text_porter_stemmed']].head())


# ── 4. Stemming — Lancaster Stemmer ──────────────────────────────────────────

lancaster_stemmer = LancasterStemmer()

def lancaster_stemming(text):
    """Applies Lancaster Stemmer to each word in text."""
    return " ".join([lancaster_stemmer.stem(word) for word in text.split()])

df['lancaster_stemmed'] = df['text'].apply(lancaster_stemming)

print("\n── After Lancaster Stemming ──")
print(df[['label', 'text', 'lancaster_stemmed']].head())


# ── 5. Custom Stemmer ─────────────────────────────────────────────────────────

def custom_stemmer(text):
    """
    Rule-based custom stemmer:
    - Strips -ing (3 chars)
    - Strips -ed  (2 chars)
    - Strips -s   (1 char)
    """
    words = text.split()
    stemmed_words = []
    for word in words:
        if word.endswith('ing'):
            stemmed_words.append(word[:-3])
        elif word.endswith('ed'):
            stemmed_words.append(word[:-2])
        elif word.endswith('s'):
            stemmed_words.append(word[:-1])
        else:
            stemmed_words.append(word)
    return " ".join(stemmed_words)

df['custom_stemmed'] = df['text'].apply(custom_stemmer)

print("\n── After Custom Stemming ──")
print(df[['label', 'text', 'custom_stemmed']].head())


# ── 6. Lemmatization — WordNet ────────────────────────────────────────────────

lemmatizer = WordNetLemmatizer()

def lemmatize_text(text):
    """Applies WordNet Lemmatizer to each word."""
    return " ".join([lemmatizer.lemmatize(word) for word in text.split()])

df['text_lemmatized'] = df['text_no_custom_stopwords'].apply(lemmatize_text)

print("\n── After Lemmatization ──")
print(df[['label', 'text', 'text_lemmatized']].head())


# ── 7. Snowball Stemmer ───────────────────────────────────────────────────────

snowball_stemmer = SnowballStemmer('english')

def snowball_stemming(text):
    """Applies Snowball Stemmer to each word."""
    return " ".join([snowball_stemmer.stem(word) for word in text.split()])

df['text_snowball_stemmed'] = df['text_no_custom_stopwords'].apply(snowball_stemming)

print("\n── After Snowball Stemming ──")
print(df[['label', 'text', 'text_snowball_stemmed']].head())


# ── 8. Urdu/Punjabi Dataset — Tokenization ───────────────────────────────────
# Dataset: https://www.kaggle.com/datasets/malaikabasharat/urdu-punjabi-merged-dataset

print("\n" + "=" * 60)
print("URDU/PUNJABI DATASET — TOKENIZATION")
print("=" * 60)

df_urdu = pd.read_csv('urdu_punjabi_merged_Dataset.csv')
print("Urdu/Punjabi Dataset shape:", df_urdu.shape)
print(df_urdu.head())

def tokenize_text(text):
    """Simple whitespace tokenizer for Urdu/Punjabi text."""
    return str(text).split()

df_urdu['tokens'] = df_urdu['word'].apply(tokenize_text)

print("\n── After Tokenization ──")
print(df_urdu[['word', 'tokens']].head(10))


# ── Final Summary ─────────────────────────────────────────────────────────────

print("\n" + "=" * 60)
print("PREPROCESSING PIPELINE COMPLETE")
print("Columns added to df:")
for col in df.columns:
    print(f"  - {col}")
print("=" * 60)

# iTaqiZ - PK
