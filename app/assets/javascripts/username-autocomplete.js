// 1.
let userFirst = "", userLast = "";
let properFirst, properLast;

const firstNameInput = document.querySelector('input#nomad_first_name'),
      lastNameInput = document.querySelector('input#nomad_last_name'),
      userNameInput = document.querySelector('input#nomad_username');
      pathname = window.location.pathname

// 2.
function upcase(string) {
  return string.charAt(0).toUpperCase() + string.slice(1);
};

function storeFirst(e) {
  text = e.target.value.trim();
  userFirst = text;
  createUsermane();
};

function storeLast(e) {
  text = e.target.value.trim();
  userLast = text;
  createUsermane();
};

function createUsermane() {
  console.log(userFirst, userLast);

  if (userFirst !== undefined) {properFirst = upcase(userFirst)};
  if (userLast !== undefined) {properLast = upcase(userLast)};

  // The thing to fill
  userNameInput.value = properFirst + properLast;
};

// 3.
if (pathname === '/nomads/sign_up' && ) {
  firstNameInput.addEventListener('blur', storeFirst);
  lastNameInput.addEventListener('blur', storeLast);
};
