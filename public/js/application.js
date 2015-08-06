$(document).ready(function() {
  $('.edit-answer-button > a').on("click", function(event) {
    event.preventDefault();
    var url = this.href;
    var answerId = $(this).parents()[0].id;
    var editFormRequest = $.ajax({
      url: url,
      method: "get"
    });
    editFormRequest.done(function(responseData) {
      var editForm = $(responseData).find(".edit-answer-form");
      var postBody = $('#body-' + answerId);
      $(postBody).hide();
      $($(postBody).parents()[0]).append(editForm);
      $('.edit-answer-form').on('submit', function(event) {
        event.preventDefault();
        var url = $(this).find("form").attr("action");
        var newData = $(this).find('textarea').val();
        var editRequest = $.ajax({
          url: url,
          method: "put",
          data: { answer: newData }
        });
        editRequest.done(function(response) {
          $(postBody).find('span').text(newData);
          $(editForm).remove();
          $(postBody).show();
        });
      });
    });
  });


});
