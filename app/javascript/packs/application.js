import "bootstrap";

import { initSweetalert } from './finished_game_popup.js';

const sweetAlertButton = $('#sweet-alert-demo');
const rightGuesses = sweetAlertButton.attr('data-right-inputs');
const numberInput = sweetAlertButton.attr('data-number-of-inputs');
const paragraphId = sweetAlertButton.attr('data-text-paragraph-id');

initSweetalert('#sweet-alert-demo', {
  title: "Great try!",
  text: `You had ${rightGuesses} out of ${numberInput}`,
  icon: "success",
  buttons: ["Retry!", "Play another game!"]
  // },function() {
  // if buttons.className === "confirm"
  //   console.log("Confirmed!");
  // } else {
  //   console.log("Denied!");
  //   // window.location.href = `/text_paragraphs/${@text_paragraph}/game_sessions`;
  // }
});



