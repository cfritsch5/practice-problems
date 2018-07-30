document.addEventListener("DOMContentLoaded", () => {
  let boundingBox = document.getElementsByClassName('bounding-box')[0];
  let style = document.createHTML('style');
  style.innerHTML(`
      .field {

    }
    `);
  boundingBox.appendChild(style);
});
