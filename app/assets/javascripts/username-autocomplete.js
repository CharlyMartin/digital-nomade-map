// 1.
let userFirst,
    userLast,
    properFirst,
    properLast;

const firstNameInput = document.querySelector('input#nomad_first_name'),
      lastNameInput = document.querySelector('input#nomad_last_name'),
      userNameInput = document.querySelector('input#nomad_username');
      url = window.location.href

// 2.
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
  userNameInput.value = ""
  if (userFirst !== undefined) {
    properFirst = userFirst.charAt(0).toUpperCase() + userFirst.slice(1);
  };

  if (userLast !== undefined) {
    properLast = userLast.charAt(0).toUpperCase() + userLast.slice(1);
  };

  let username = properFirst + properLast;
  // The thing to fill
  userNameInput.value = username;
};

// 3.
// if (url === 'https://www.nomadmap.co/nomads/sign_up' && 'https://www.nomadmap.co/nomads') {
  firstNameInput.addEventListener('blur', storeFirst);
  lastNameInput.addEventListener('blur', storeLast);
// };
