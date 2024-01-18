document.addEventListener('DOMContentLoaded', () => {
  const heroField = document.getElementById('hero-field');
  const hero = document.getElementById('hero');
  
  function moveHero(event) {
    // フィールドの位置とサイズを取得
    const fieldRect = heroField.getBoundingClientRect();
    
    // ボーダーを含めたヒーローの全幅と全高を取得
    const heroWidth = hero.offsetWidth;  // ボーダーを含むヒーローの幅
    const heroHeight = hero.offsetHeight; // ボーダーを含むヒーローの高さ

    // クリック位置からフィールドのオフセットを引き、
    // ヒーローの画像の中心がクリック点に合うように調整
    const newX = event.clientX - fieldRect.left - (heroWidth / 2);
    const newY = event.clientY - fieldRect.top - (heroHeight / 2);

    // 座標がフィールドの範囲内に収まるように制限
    const finalX = Math.max(0, Math.min(fieldRect.width - heroWidth, newX));
    const finalY = Math.max(0, Math.min(fieldRect.height - heroHeight, newY));

    // ヒーローの位置を更新
    hero.style.left = `${finalX}px`;
    hero.style.top = `${finalY}px`;
  }

  // ヒーローフィールドにイベントリスナーを設定
  heroField.addEventListener('click', moveHero);
});






