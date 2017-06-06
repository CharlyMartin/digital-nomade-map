// 1.
const avatar = document.querySelector('#avatar-home'),
  slideMenu = document.querySelector('.devise-container');

// 2.
function toggleMenu() {
  slideMenu.classList.toggle('active')
}

// 3.
if (avatar) {
  avatar.addEventListener('click', toggleMenu);
}
