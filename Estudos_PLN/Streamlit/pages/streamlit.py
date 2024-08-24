import streamlit as st
import pandas as pd
import numpy as np

data = pd.read_csv("imdb_movies_shows.csv")
st.write(data)

st.write("## This is a H2 Title")

x = st.text_input("Favourite Movie?") 
st.write(f"Your favorite movie is: {x}")

is_clicked = st.button("Button")

chart_data = pd.DataFrame(
    np.random.rand(20, 3), 
    columns = ["a", "b", "c"]
)

st.bar_chart(chart_data)
st.line_chart(chart_data)

# botão que serve para redirecionar o usuário para uma diferente passa
st.link_button("Profile", url = "profile")