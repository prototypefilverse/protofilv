// /Users/morikawa/projects/protofilv/app/javascript/hero_field.js

document.addEventListener('turbolinks:load', () => {
  const heroAvatar = document.querySelector('.yuusya_image');
  
  if (heroAvatar) {
    heroAvatar.addEventListener('click', () => {
      // ここに勇者がフィールドで活躍するためのコードを書きます
      console.log('勇者が活躍を始めました！');
      // 例えば、バトルフィールドに遷移するか、何かアクションを起こすなど
    });
  }
});
