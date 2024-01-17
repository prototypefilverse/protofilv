import heroImage from 'images/yuusya.png'; // webpackerを使っている場合

document.addEventListener('turbolinks:load', () => {
  const field = document.querySelector('.field-side');
  if (field) {
    const heroAvatar = document.createElement('img');
    heroAvatar.src = heroImage; // importした画像パスを使用
    heroAvatar.classList.add('hero-avatar');
    field.appendChild(heroAvatar);

    // その他のフィールドの動作に関するスクリプト
  }
});