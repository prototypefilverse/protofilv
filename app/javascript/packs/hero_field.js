document.addEventListener('DOMContentLoaded', () => {
  const heroField = document.getElementById('hero-field');
  const hero = document.getElementById('hero');
  
  function moveHero(event) {
    // フィールドの位置とサイズを取得
    const fieldRect = heroField.getBoundingClientRect();
    // 表示される画像のサイズを取得（ここではHTMLで設定されたサイズを使用）
    const heroWidth = 80;  // 表示領域の幅
    const heroHeight = 64; // 表示領域の高さ

    // クリック位置からフィールドのオフセットと画像サイズの半分を引いて、勇者の新しい位置を計算
    const newX = event.clientX - fieldRect.left - (heroWidth / 2);
    const newY = event.clientY - fieldRect.top - (heroHeight / 2);

    // 座標がフィールドの範囲内に収まるように制限
    const finalX = Math.max(0, Math.min(fieldRect.width - heroWidth, newX));
    const finalY = Math.max(0, Math.min(fieldRect.height - heroHeight, newY));

    // 勇者の位置を更新
    hero.style.left = `${finalX}px`;
    hero.style.top = `${finalY}px`;
  }

  heroField.addEventListener('click', moveHero);
});






