

document.addEventListener('turbolinks:load', () => {
  const heroAvatar = document.querySelector('.yuusya_image');

  if (heroAvatar) {
    heroAvatar.addEventListener('click', (e) => {
      e.preventDefault(); // デフォルトのリンクの動作を防ぎます
      alert('勇者が活躍を始めました！');
      // ここに他のアクションやアニメーションを追加できます
    });
  }
});

