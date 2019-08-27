import "bootstrap";


$('#game1_popup_window').hide();
$('#trigger').click(function() {
  console.log("hey")
  $('#game1_popup_window').slideToggle("slow");
})

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
