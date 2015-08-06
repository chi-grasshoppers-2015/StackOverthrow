$(document).ready(function() {
  $('.edit-answer-button > a').on("click", handleEditRequest);
  $('.edit-comment-button > a').on("click", handleCommentEditRequest);
});

var handleEditRequest = function(event) {
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
    $($(postBody).parents()[0]).prepend(editForm);
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
}

var handleCommentEditRequest = function(event) {
  event.preventDefault();
  var url = this.href;
  var commentId = $(this).parents()[0].id;
  var editCommentFormRequest = $.ajax({
    url: url,
    method: "get"
  });
  editCommentFormRequest.done(function(response) {
    var editForm = $(response).find(".edit-comment-form");
    var commentBody = $('#comment-body-' + commentId);
    $(commentBody).hide();
    $('.edit-comment-button').hide();
    $($(commentBody).parents()[0]).append(editForm);
    $('.edit-comment-form').on('submit', function(event) {
      event.preventDefault();
      var url = $(this).attr("action");
      var newData = $(this).find('textarea').val();
      var editRequest = $.ajax({
        url: url,
        method: "put",
        data: { comment: newData }
      });
      editRequest.done(function(response) {
        $(commentBody).find('span').text(newData);
        $(editForm).remove();
        $(commentBody).show();
        $('.edit-comment-button').show();
      });
    });
  });
}
