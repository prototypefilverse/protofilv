// /Users/morikawa/projects/protofilv/app/javascript/avatarField.js

document.addEventListener('turbolinks:load', () => {
  const canvas = document.getElementById('gameField');
  if (canvas) {
    const ctx = canvas.getContext('2d');

    // 勇者アバターの画像を読み込む
    const heroImage = new Image();
    heroImage.src = 'path_to_yuusya_image'; // 勇者の画像へのパスを指定

    heroImage.onload = () => {
      ctx.drawImage(heroImage, 0, 0, 50, 50); // 勇者をキャンバスに描画
    };

    // TODO: ここで勇者の動きやゲームロジックを追加
  }
});

