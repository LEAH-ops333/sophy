import base64
import re
from pathlib import Path

# 定义路径
html_path = Path(__file__).parent / "templates" / "homepage.html"
static_dir = Path(__file__).parent / "static" / "IMAGES"
output_html_path = Path(__file__).parent / "templates" / "homepage_embedded.html"

# 读取原始 HTML
with open(html_path, "r", encoding="utf-8") as f:
    html_content = f.read()

def image_to_base64(image_path):
    """将图片文件转为 Base64 数据 URL"""
    if not image_path.exists():
        return None
    with open(image_path, "rb") as f:
        img_data = f.read()
    b64 = base64.b64encode(img_data).decode("utf-8")
    ext = image_path.suffix.lower()
    mime = "image/jpeg" if ext in [".jpg", ".jpeg"] else "image/png"
    return f"data:{mime};base64,{b64}"

# ========== 替换 <img src="..."> 中的图片路径 ==========
def replace_img_src(match):
    filename = match.group(1)
    img_path = static_dir / filename
    if img_path.exists():
        b64_url = image_to_base64(img_path)
        if b64_url:
            return f'src="{b64_url}"'
    return match.group(0)  # 保持原样

# 匹配 src="任意前缀/IMAGES/文件名.扩展名"
pattern_img = r'src="[^"]*?/IMAGES/([^"]+\.(jpg|jpeg|png))"'
html_content = re.sub(pattern_img, replace_img_src, html_content, flags=re.IGNORECASE)

# ========== 替换 JavaScript 中 carouselItems 的 imgSrc ==========
def replace_imgsrc(match):
    filename = match.group(1)
    img_path = static_dir / filename
    if img_path.exists():
        b64_url = image_to_base64(img_path)
        if b64_url:
            return f'imgSrc:"{b64_url}"'
    return match.group(0)

pattern_imgsrc = r'imgSrc:\s*"[^"]*?/IMAGES/([^"]+\.(jpg|jpeg|png))"'
html_content = re.sub(pattern_imgsrc, replace_imgsrc, html_content, flags=re.IGNORECASE)

# ========== 额外处理可能存在的 src 为 /static/IMAGES/ 的写法 ==========
pattern_static = r'src="[^"]*?/static/IMAGES/([^"]+\.(jpg|jpeg|png))"'
html_content = re.sub(pattern_static, replace_img_src, html_content, flags=re.IGNORECASE)

# ========== 保存新 HTML ==========
with open(output_html_path, "w", encoding="utf-8") as f:
    f.write(html_content)

print(f"✅ 图片嵌入完成！新文件已保存为 {output_html_path}")