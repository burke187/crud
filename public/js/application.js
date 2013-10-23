$(document).ready(function() {
  
  // Click on create a new person
  $("#new_person_link").on("click", function(event){
    event.preventDefault();

    $.get('/people/new', function(response) {
      $("#new_person_link").hide();
      $(".container").append(response);
    });
  });

  // Submit the form for a new person
  $('.container').on('submit', 'form', function(event) {
    event.preventDefault();
    var data = $('form').serialize();
    $.post('/people', data, function(response){
      $('form').remove();
      $('#new_person_link').before(response);
      $("#new_person_link").show();
    });
  });

  // Deleting a person from the index
  $('.container').on('click', '.delete_user_link', function(event) {
    event.preventDefault();

    var that = this
    var url = $(that).attr('href')

    $.get(url, function(response){
      console.log(response);
      $(that).parent().remove();
    });
  });
});
