// 1.
const firstInput = document.querySelector('input#nomad_first_name');
const lastInput = document.querySelector('input#nomad_last_name');
const usernameInput = document.querySelector('input#nomad_username');

// 2.
function store(e) {
  let name = e.target.value
  usernameInput.value = name;

};

// 3.
if (firstInput) {
  firstInput.addEventListener('blur', store)
};

// if (lastInput) {
//   lastInput.addEventListener('keyup', test)
// }
