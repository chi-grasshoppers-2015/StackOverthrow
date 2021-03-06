$(document).ready(function() {
  $('.edit-answer-button > a').on("click", handleEditRequest);
  $(document).on("click", '.edit-comment-button > a', handleCommentEditRequest);
  $('.add-comment-form').on("submit", handleNewCommentRequest);
  handleUserPage();
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

var handleNewCommentRequest = function(event) {
  event.preventDefault();
  var url = this.action;
  var commentBody = $(this).find('textarea').val();
  var commentableId = $($(this).find('input[type=hidden]')[1]).val();
  var commentableType = $($(this).find('input[type=hidden]')[0]).val();
  var commentParams = { body: commentBody, commentable_id: commentableId, commentable_type: commentableType };
  var newCommentRequest = $.ajax({
    url: url,
    method: "post",
    data: { comment: commentParams }
  });
  newCommentRequest.done(function(response) {
    $('#post-comments-' + commentableId + ' > #post_comment_div').append(response);
  });
  $(this).find('textarea').val("");
}

var handleUserPage = function() {
  $(".username_default").hide();
  $(".profile_nav").show();
  $("#answers").hide();
  $("#comments").hide();
  $(".container").on("click", ".tabs li a", function(event){
    event.preventDefault();
    $(this).css("border", "none");
    $("li").removeClass("active");
    $( this ).parent().addClass( "active" );
    var tab_id = $(this).attr('href');
    $("#questions").hide();
    $("#answers").hide();
    $("#comments").hide();
    $(tab_id).show();
  });
};
