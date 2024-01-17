document.addEventListener('turbolinks:load', () => {
  const field = document.querySelector('.field-side');
  if (field) {
    // 勇者が活躍するフィールドに関連するJavaScriptコードをここに配置
    // 例：勇者のアニメーションやイベントリスナーの設定
    const heroAvatar = document.createElement('img');
    heroAvatar.src = 'path_to_your_hero_image.png'; // 勇者の画像パスを設定
    heroAvatar.classList.add('hero-avatar');
    field.appendChild(heroAvatar);

    // その他のフィールドの動作に関するスクリプト
  }
});
