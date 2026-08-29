<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
    <title>My Page</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', 'Poppins', system-ui, sans-serif;
            background: linear-gradient(500deg, #f8f0ff 100%, #d7c8f3 100%);
            scroll-behavior: smooth;
            position: relative;
            overflow-x: hidden;
        }

        #dot-canvas {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 0;
        }

        .hero-title {
            text-align: center;
            padding: 4rem 1rem 2rem;
            font-size: 3.5rem;
            font-weight: 800;
            letter-spacing: -0.02em;
            background: linear-gradient(135deg, #341e3c, #d1a0ff);
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;
            position: relative;
            z-index: 3;
        }
        .sub-title {
            text-align: center;
            font-size: 2rem;
            position: relative;
            z-index: 3;
        }
        @media (max-width: 640px) {
            .hero-title { font-size: 2.2rem; padding: 2rem 1rem; }
        }
        .navbar {
            position: sticky;
            top: 0;
            z-index: 3;
            backdrop-filter: blur(16px);
        }
        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 0.5rem;
            padding: 0.8rem 1rem;
        }
        .nav-item {
            padding: 0.6rem 1.5rem;
            margin: 0 0.2rem;
            font-size: 1rem;
            font-weight: 600;
            color: #6b29b0;
            background: transparent;
            border-radius: 40px;
            cursor: pointer;
            transition: all 0.25s;
            text-decoration: none;
            display: inline-block;
        }

        .nav-item.active {
            background: rgba(149, 104, 239, 0.81);
        }

        .sections-wrapper {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem 1.5rem 4rem;
            position: relative;
            z-index: 2;
        }
        .section {
            background: rgba(255, 255, 255, 0.75);
            backdrop-filter: blur(4px);
            border-radius: 48px;
            padding: 2rem 2rem;
            margin-bottom: 3rem;
            box-shadow: 0 8px 20px rgba(0,0,0,0.05);
            scroll-margin-top: 80px;
            border: 1px solid rgba(255,255,255,0.6);
        }
        .section h2 {
            font-size: 2rem;
            margin-bottom: 1rem;
            color: #6010a1;
            padding-left: 1rem;
        }
        .section p {
            line-height: 1.6;
            color: #382c4e;
            font-size: 1.05rem;
            white-space: pre-wrap;
        }

        .card-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 1.5rem;
            margin-top: 1.5rem;
        }

        .card1 {
            background: white;
            border-radius: 24px;
            padding: 1.2rem;
            flex: 1 1 200px;
            box-shadow: 0 5px 12px rgba(0,0,0,0.08);
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .card1:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 20px rgba(0,0,0,0.12);
        }
        .card1 h2 {
            font-size: 1.8rem;
            margin-bottom: 1rem;
            color: #4a2c6d;
        }
        .card1 p {
            margin-bottom: 0.75rem;
        }
        .card2 {
            background: white;
            border-radius: 28px;
            overflow: hidden;
            box-shadow: 0 10px 20px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
            break-inside: avoid;
            margin-bottom: 1.5rem;
            display: flex;
            flex-direction: column;
        }
        .card2:hover {
            transform: translateY(-3px);
            box-shadow: 0 18px 30px rgba(0,0,0,0.12);
        }
        .card2-img {
            width: auto;
            height: auto;
            object-fit: contain;
            display: block;
            background: linear-gradient(135deg, #d1a0ff, #8e5be6);
        }
        .card2-content {
            padding: 1.2rem 1.2rem 1.5rem;
        }
        .card2-title {
            font-size: 1.3rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            color: #402c68;
        }
        .card2-desc {
            font-size: 0.95rem;
            color: #634a7a;
            line-height: 1.5;
        }

        .card-grid:has(.card2) {
            display: block;
            column-count: 2;
            column-gap: 1.5rem;
        }
        @media (max-width: 680px) {
            .card-grid:has(.card2) {
                column-count: 1;
            }
            .card2-img {
                height: auto;
            }
        }

        footer {
            text-align: center;
            padding: 2rem;
            color: #634a7a;
            border-top: 1px solid rgba(0,0,0,0.05);
            font-size: 0.85rem;
            position: relative;
            z-index: 2;
        }
        @media (max-width: 680px) {
            .sections-wrapper { padding: 1rem; }
            .section { padding: 1.2rem; }
            .section h2 { font-size: 1.6rem; }
            .nav-item { padding: 0.4rem 1rem; font-size: 0.85rem; }
        }

        #p1.section {
            width: 90%;
            margin-left: 0;
            margin-right: auto;
            border-radius: 48px 0 48px 0;
        }
        #p2.section {
            width: 85%;
            margin-left: auto;
            margin-right: 0;
            border-radius: 0 48px 0 48px;
            box-shadow: -10px 10px 20px rgba(0,0,0,0.1);
        }

        .p-section {
            width: 110%;
            margin-left: -5%;
            border-radius: 60px 20px 60px 20px;
        }
        .end-section {
            width: 70%;
            margin-left: auto;
            margin-right: auto;
            border-radius: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            backdrop-filter: none;
            text-align: center;
        }
        @media (max-width: 768px) {
            #p1.section, #p2.section,
            #p.section, #end.section {
                width: 100%;
                margin-left: 0;
                margin-right: auto;
                border-radius: 48px;
                transform: none;
                box-shadow: 0 8px 20px rgba(0,0,0,0.05);
            }
        }

        .photo-side-row {
            display: flex;
            flex-wrap: wrap;
            gap: 1.8rem;
            align-items: flex-start;
            margin-top: 0.5rem;
        }
        .photo-side-row .content-area {
            flex: 2;
            min-width: 200px;
        }
        .photo-side-row .image-area {
            flex: 1;
            min-width: 140px;
        }
        .side-photo {
            width: 100%;
            height: auto;
            border-radius: 28px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            object-fit: cover;
            transition: transform 0.2s ease;
            display: block;
            background: #eef2f5;
        }
        .side-photo:hover {
            transform: scale(1.02);
        }
        @media (max-width: 680px) {
            .photo-side-row .content-area,
            .photo-side-row .image-area {
                flex: 1 1 100%;
            }
        }
        /* 轮播图片 */
        .carousel-container {
            position: relative;
            max-width: 600px;
            margin: 0 auto;
            overflow: hidden;
            border-radius: 28px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.08);
        }
        .carousel-slide {
            display: flex;
            transition: transform 0.4s ease-in-out;
        }
        .carousel-card {
            flex: 0 0 100%;
            background: white;
            border-radius: 28px;
            overflow: hidden;
        }
        .carousel-card .card2-img {
            width: 100%;
            height: 280px;
            object-fit: cover;
            display: block;
            background: linear-gradient(135deg, #d1a0ff, #8e5be6);
        }
        .carousel-card .card2-content {
            padding: 1.2rem 1.2rem 1.5rem;
        }
        .carousel-card .card2-title {
            font-size: 1.3rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            color: #402c68;
        }
        .carousel-card .card2-desc {
            font-size: 0.95rem;
            color: #634a7a;
            line-height: 1.5;
        }
        .carousel-btn {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background: rgba(255,255,255,0.7);
            backdrop-filter: blur(4px);
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            cursor: pointer;
            font-size: 1.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s;
            z-index: 2;
            color: #4a2c6d;
        }
        .carousel-btn:hover {
            background: rgba(255,255,255,0.9);
            transform: translateY(-50%) scale(1.05);
        }
        .btn-prev {
            left: 10px;
        }
        .btn-next {
            right: 10px;
        }
        .carousel-dots {
            text-align: center;
            margin-top: 1rem;
        }
        .dot {
            display: inline-block;
            width: 10px;
            height: 10px;
            background: #ccc;
            border-radius: 50%;
            margin: 0 5px;
            cursor: pointer;
            transition: background 0.2s;
        }
        .dot.active {
            background: #8e5be6;
        }
        @media (max-width: 680px) {
            .carousel-card .card2-img {
                height: 200px;
            }
        }
    </style>
</head>
<body>

<canvas id="dot-canvas"></canvas>

<div class="hero-title">
    ✨ Welcome to my page ✨
</div>

<div class="sub-title">
    Hi~ I am Leah OvO *
</div>

<div class="navbar">
    <div class="nav-container">
        <a href="#p1" class="nav-item" data-nav="p1">🔹About this page🔹</a>
        <a href="#p2" class="nav-item" data-nav="p2">🔹This is Me!🔹</a>
        <a href="#p3" class="nav-item" data-nav="p3">🔹This is Me And My BEST FRI!🔹</a>
        <a href="#p4" class="nav-item" data-nav="p4">🔹Activities🔹</a>
        <!-- <a href="#p5" class="nav-item" data-nav="p5">Latest Updates</a> -->
        <a href="#p6" class="nav-item" data-nav="p6">🔹Contact me🔹</a>
    </div>
</div>

<div class="sections-wrapper">
    <!-- Home 板块：右侧添加 AA.jpg -->
    <section id="p1" class="section">
        <h2>About this page</h2>
        <div class="photo-side-row">
            <div class="content-area">
                <p>Welcome to my personal page ~ </p>
                <p>My name is <strong>Leah</strong>, a college student. </p>
                <p>I'm majoring Big Data Management and Application in GuangDong University of Technology.</p>

                <div class="card-grid">
                    <div class="card1">
                        <h2>Why did I create this page?</h2>
                        <p>In order to present myself more intuitively, I created this page.</p>
                        <p><strong>This page includes four sections:</strong> self-introduction, hobbies, activities I participated in, and my contact information.</p>
                        <p></p>
                    </div>
                    <h3 style="color:#4a2c6d">If you are interested in me, scroll down to learn more ~ ^_^</h3>
                </div>
            </div>
            <div class="image-area">
                <img src="/IMAGES/AA.jpg" alt="AA photo" class="side-photo">
            </div>
        </div>
    </section>

    <!-- About Me 板块：左侧添加 BB.jpg -->
    <section id="p2" class="section">
        <h2>It's Me!</h2>
        <div class="photo-side-row">
            <div class="image-area">
                <img src="/IMAGES/BB.jpg" alt="BB photo" class="side-photo">
            </div>
            <div class="content-area">
                <div class="card-grid">
                    <div class="card1">
                        <p>
                            xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
                            xxxxxxxxxxx,xxxxxxxxxxxxxxxxxxxxxxxxxxxx.
                            xx,xxxxxxxxxxxxxxxxx.xxxxxxxxxxxxxx,xxx,x
                            xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,xxxxxxx
                            xxxxxxxxx,xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="p-section">
        <section id="p3" class="section">

            <h2>This is also Me!</h2>
            <div class="card-grid">
                <div class="card2">
                    <img src="/IMAGES/CC.jpg" alt="interest1" class="card2-img">
                    <div class="card2-content">
                        <div class="card2-title">Music</div>
                        <div class="card2-desc"><div class="card1">
                            I first encountered the <strong>clarinet</strong> during my elementary
                            school years when I joined the school's band. Ever since then, I have fallen
                            in love with the clarinet and music.</div></div>
                    </div>
                </div>
                <div class="card2">
                    <img src="/IMAGES/DD.jpg" alt="interest2" class="card2-img">
                    <div class="card2-content">
                        <div class="card2-title">Travel</div>
                        <div class="card2-desc"><div class="card1">
                            I really enjoy <strong>traveling</strong>. Even though I like the city
                            where I currently live, I still think it's fun to briefly visit a strange
                            place and experience different customs and cultures.<br>
                            Compared to a tightly scheduled itinerary, I prefer a more relaxed travel
                            style, choosing places that I like over popular tourist attractions, and
                            stepping into street food stalls instead of elegant restaurants.</div></div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 轮播图片 -->
        <section id="p4" class="section">
            <h2>Activities</h2>
            <div class="carousel-container">
                <div class="carousel-slide" id="carouselSlide">
                </div>
                <button class="carousel-btn btn-prev" id="prevBtn">❮</button>
                <button class="carousel-btn btn-next" id="nextBtn">❯</button>
            </div>
            <div class="carousel-dots" id="carouselDots"></div>
        </section>

        <!-- <section id="p5" class="section">
            <h2>Latest Updates</h2>
            <div class="card-grid">
                <div class="card1">🔹 First</div>
                <div class="card1">🔹 Second</div>
                <div class="card1">🔹 Third</div>
            </div>
        </section>
    </div> -->

    <div class="end-section">
        <section id="p6" class="section">
            <h2>Contact me</h2>
            <p>email: numbers@xx.com</p>
            <p>mobile-phone: xxxxxxxxxxx</p>
            <p>Welcome to communicate with me～</p>
        </section>
    </div></div>

<footer>
    © 2026 leah's personal webpage
</footer>

<script>
    (function() {
        const navLinks = document.querySelectorAll('.nav-item');
        const sections = document.querySelectorAll('.section');

        function setActiveNav() {
            let current = '';
            const scrollPos = window.scrollY + 100;
            sections.forEach(section => {
                const sectionTop = section.offsetTop;
                const sectionBottom = sectionTop + section.offsetHeight;
                if (scrollPos >= sectionTop && scrollPos < sectionBottom) {
                    current = section.getAttribute('id');
                }
            });
            navLinks.forEach(link => {
                link.classList.remove('active');
                const href = link.getAttribute('href');
                if (href === `#${current}`) {
                    link.classList.add('active');
                }
            });
        }

        navLinks.forEach(link => {
            link.addEventListener('click', function(e) {
                e.preventDefault();
                const targetId = this.getAttribute('href');
                if (targetId && targetId !== '#') {
                    const targetElement = document.querySelector(targetId);
                    if (targetElement) {
                        const navbar = document.querySelector('.navbar');
                        const navbarHeight = navbar ? navbar.offsetHeight : 0;
                        const offsetTop = targetElement.getBoundingClientRect().top + window.scrollY - navbarHeight;
                        window.scrollTo({ top: offsetTop, behavior: 'smooth'
                        });
                        history.pushState(null, null, targetId);
                    }
                }
            });
        });

        window.addEventListener('scroll', setActiveNav);
        window.addEventListener('resize', setActiveNav);
        setActiveNav();

        if (window.location.hash) {
            const hash = window.location.hash;
            const targetEl = document.querySelector(hash);
            if (targetEl) {
                setTimeout(() => {
                    const offset = targetEl.offsetTop - 70;
                    window.scrollTo({ top: offset, behavior: 'smooth' });
                }, 200);
            }
        }
    })();

    (function initDots() {
        const canvas = document.getElementById('dot-canvas');
        if (!canvas) return;

        const colors = [
            'rgb(255,255,255)',
            'rgba(135,105,192,0.55)'
        ];

        const MIN_RADIUS = 30;
        const MAX_RADIUS = 80;
        const EXTRA_GAP = 200;

        let placedDots = [];

        function isOverlap(x, y, r) {
            for (let dot of placedDots) {
                const dx = dot.x - x;
                const dy = dot.y - y;
                const minDist = dot.r + r + EXTRA_GAP;
                if (dx * dx + dy * dy < minDist * minDist) return true;
            }
            return false;
        }

        function tryPlaceDot(width, height, maxAttempts = 800) {
            for (let attempt = 0; attempt < maxAttempts; attempt++) {
                const radius = Math.random() * (MAX_RADIUS - MIN_RADIUS) + MIN_RADIUS;
                const x = Math.random() * (width - 2 * radius) + radius;
                const y = Math.random() * (height - 2 * radius) + radius;
                if (!isOverlap(x, y, radius)) {
                    return { x, y, r: radius };
                }
            }
            return null;
        }

        let dotsToDraw = [];
        let currentIndex = 0;
        let animationFrameId = null;

        function drawOneDot(ctx, dot) {
            const color = colors[Math.floor(Math.random() * colors.length)];
            ctx.beginPath();
            ctx.arc(dot.x, dot.y, dot.r, 0, Math.PI * 2);
            ctx.fillStyle = color;
            ctx.fill();
        }

        function animateDots(ctx) {
            if (currentIndex < dotsToDraw.length) {
                const batchSize = Math.min(3, dotsToDraw.length - currentIndex);
                for (let i = 0; i < batchSize; i++) {
                    drawOneDot(ctx, dotsToDraw[currentIndex]);
                    currentIndex++;
                }
                animationFrameId = requestAnimationFrame(() => animateDots(ctx));
            } else {
                cancelAnimationFrame(animationFrameId);
                animationFrameId = null;
            }
        }

        function generateAndAnimateDots() {
            const body = document.body;
            const width = body.clientWidth;
            const height = body.scrollHeight;

            canvas.width = width;
            canvas.height = height;
            canvas.style.width = width + 'px';
            canvas.style.height = height + 'px';

            const ctx = canvas.getContext('2d');
            ctx.clearRect(0, 0, width, height);

            placedDots = [];
            dotsToDraw = [];
            currentIndex = 0;
            if (animationFrameId) cancelAnimationFrame(animationFrameId);

            const area = width * height;
            let targetCount = Math.floor(area / 18000);
            targetCount = Math.min(targetCount, 60);
            targetCount = Math.max(targetCount, 15);

            let successCount = 0;
            for (let i = 0; i < targetCount * 1.5; i++) {
                if (successCount >= targetCount) break;
                const dot = tryPlaceDot(width, height, 500);
                if (dot) {
                    placedDots.push(dot);
                    dotsToDraw.push(dot);
                    successCount++;
                } else break;
            }

            animateDots(ctx);
        }

        generateAndAnimateDots();

        let resizeTimer;
        window.addEventListener('resize', function() {
            clearTimeout(resizeTimer);
            resizeTimer = setTimeout(() => {
                generateAndAnimateDots();
            }, 150);
        });

        window.addEventListener('load', function() {
            generateAndAnimateDots();
        });
    })();

        // 轮播数据（图片路径、标题、描述）
        const carouselItems = [
        {
            imgSrc: "<%=request.getContextPath()%>/IMAGES/1.jpg",
            title: "Project 1",
            desc: "简单介绍1"
        },
        {
            imgSrc: "<%=request.getContextPath()%>/IMAGES/2.jpg",
            title: "Project 2",
            desc: "简单介绍2"
        },
        {
            imgSrc: "<%=request.getContextPath()%>/IMAGES/3.jpg",
            title: "Project 3",
            desc: "简单介绍3"
        },
        {
            imgSrc: "<%=request.getContextPath()%>/IMAGES/4.jpg",
            title: "Project 4",
            desc: "简单介绍4"
        }
        ];

        let currentIndex = 0;
        const slideContainer = document.getElementById('carouselSlide');
        const dotsContainer = document.getElementById('carouselDots');
        const prevBtn = document.getElementById('prevBtn');
        const nextBtn = document.getElementById('nextBtn');

        // 渲染轮播卡片和指示点
        function renderCarousel() {
        // 生成所有卡片（用于滑动）
        slideContainer.innerHTML = carouselItems.map(item => `
            <div class="carousel-card">
                <img src="${item.imgSrc}" alt="${item.title}" class="card2-img">
                <div class="card2-content">
                    <div class="card2-title">${item.title}</div>
                    <div class="card2-desc">${item.desc}</div>
                </div>
            </div>
        `).join('');

        // 生成指示点
        dotsContainer.innerHTML = carouselItems.map((_, idx) => `
            <span class="dot ${idx === currentIndex ? 'active' : ''}" data-index="${idx}"></span>
        `).join('');

        // 滚动到当前卡片
        slideContainer.style.transform = `translateX(-${currentIndex * 100}%)`;
    }

        // 切换到指定索引
        function goToSlide(index) {
        if (index < 0) index = carouselItems.length - 1;
        if (index >= carouselItems.length) index = 0;
        currentIndex = index;
        slideContainer.style.transform = `translateX(-${currentIndex * 100}%)`;
        // 更新指示点样式
        document.querySelectorAll('.dot').forEach((dot, i) => {
        if (i === currentIndex) dot.classList.add('active');
        else dot.classList.remove('active');
    });
    }

        // 事件绑定
        prevBtn.addEventListener('click', () => goToSlide(currentIndex - 1));
        nextBtn.addEventListener('click', () => goToSlide(currentIndex + 1));
        dotsContainer.addEventListener('click', (e) => {
        if (e.target.classList.contains('dot')) {
        const idx = parseInt(e.target.getAttribute('data-index'));
        if (!isNaN(idx)) goToSlide(idx);
    }
    });

        // 初始化
        renderCarousel();
</script>
</body>
</html>