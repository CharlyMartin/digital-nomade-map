// 1.
const closeButton = document.querySelector('i.delete');

// 2.
function deleteFlash() {
  this.parentNode.remove();
};

// 3.
if (closeButton) {
  closeButton.addEventListener('click', deleteFlash)
}
