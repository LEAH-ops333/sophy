import streamlit as st
from pathlib import Path

st.set_page_config(page_title="Leah's Page", layout="wide")

# 使用已嵌入 Base64 图片的 HTML 文件
html_path = Path(__file__).parent / "templates" / "homepage_embedded.html"

if not html_path.exists():
    st.error("请先运行 embed_images.py 生成 embedded 文件！")
else:
    with open(html_path, "r", encoding="utf-8") as f:
        html_content = f.read()
    st.components.v1.html(html_content, height=3500, scrolling=True)