const avatar = document.querySelector('#avatar-home'),
  slideMenu = document.querySelector('.devise-container');

function toggleMenu() {
  slideMenu.classList.toggle('active')
}

avatar.addEventListener('click', toggleMenu);
