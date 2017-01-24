const avatar = document.querySelector('#avatar-home'),
  slideMenu = document.querySelector('.slide-menu');

function toggleMenu() {
  slideMenu.classList.toggle('active')
}

avatar.addEventListener('click', toggleMenu);
