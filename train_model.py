import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Embedding, Conv1D, GlobalMaxPooling1D, Dense, Dropout
import pickle

data = pd.read_csv(r"C:\Users\ASUS\PycharmProjects\fake_news_detection\news_detection\data.csv")

data["text"] = data["Headline"] + " " + data["Body"]
data["text"] = data["text"].fillna("").astype(str).str.lower()

label_encoder = LabelEncoder()
data["Label"] = label_encoder.fit_transform(data["Label"])

X_train, X_test, y_train, y_test = train_test_split(
    data["text"], data["Label"], test_size=0.2, random_state=42
)

max_words = 20000
max_len = 200

tokenizer = Tokenizer(num_words=max_words)
tokenizer.fit_on_texts(X_train)

X_train_seq = tokenizer.texts_to_sequences(X_train)
X_train_padded = pad_sequences(X_train_seq, maxlen=max_len, padding="post")

model = Sequential([
    Embedding(max_words, 100, input_length=max_len),
    Conv1D(128, 5, activation="relu"),
    GlobalMaxPooling1D(),
    Dense(64, activation="relu"),
    Dropout(0.5),
    Dense(1, activation="sigmoid")
])

model.compile(optimizer="adam", loss="binary_crossentropy", metrics=["accuracy"])
model.fit(X_train_padded, y_train, epochs=5, batch_size=32)

model.save(r"C:\Users\ASUS\PycharmProjects\fake_news_detection\news_detection\fake_news_cnn_model.h5")

with open("tokenizer.pkl", "wb") as f:
    pickle.dump(tokenizer, f)
