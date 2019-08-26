import "bootstrap";

$(".btn-not-passed-text").hide()

$(".btn-passed-text").click(function() {
  $(this).toggle()
  $(this).siblings().toggle()
});

$(".btn-not-passed-text").click(function() {
  $(this).toggle()
  $(this).siblings().toggle()
});

$(".information-window").hide()

$(".decoration-for-navbar").click(function() {
  $(".information-window").show()
});


$(".btn-close-info").click(function() {
  $(".information-window").hide()
});
