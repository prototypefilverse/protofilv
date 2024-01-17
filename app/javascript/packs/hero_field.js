// hero_field.js
document.addEventListener('turbolinks:load', () => {
  const heroField = document.getElementById('hero-field');
  const hero = document.getElementById('hero');

  function moveHero(event) {
    // マウスクリックの位置を取得
    const newX = event.clientX - heroField.getBoundingClientRect().left;
    const newY = event.clientY - heroField.getBoundingClientRect().top;

    // 勇者の位置を更新
    hero.style.left = `${newX}px`;
    hero.style.top = `${newY}px`;
  }

  // フィールドがクリックされたら勇者を移動
  heroField.addEventListener('click', moveHero);
});


