import swal from 'sweetalert';

const initSweetalert = (selector, options = {}) => {
  const swalFinishedGame = document.querySelector('#sweet-alert-demo');
  if (swalFinishedGame) { // protect other pages
    swalFinishedGame.addEventListener('click', () => {
      swal(options);
    });
  }
};

export { initSweetalert };
