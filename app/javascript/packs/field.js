document.addEventListener('turbolinks:load', () => {
  const field = document.querySelector('.field-side');
  if (field) {
    // 勇者が活躍するフィールドに関連するJavaScriptコードをここに配置
    const heroAvatar = document.createElement('img');
    heroAvatar.src = '../../assets/images/yuusya.png'; // Railsのアセットパイプラインを使わない場合の相対パス
    heroAvatar.classList.add('hero-avatar');
    field.appendChild(heroAvatar);

    // その他のフィールドの動作に関するスクリプト
  }
});
