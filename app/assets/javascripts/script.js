$(function () {
  $('#js-gift-form-div').submit(function(event) {
    //prevent form from submitting the default way
    event.preventDefault();

    var values = $("#new_gift", this).serialize();

    var posting = $.post(`event/${event.id}/gifts`, values);

    posting.done(function(data) {
      TODO: handle response
    });
  });
});
