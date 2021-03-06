$(function(){

  function buildHTML(comment){
    var html = `
                <p>
                  <strong><a href="/users/${comment.user_id}">${comment.user_name}</a>：</strong>
                  ${comment.text}
                </p>

                `
    return html;
  }

  $('.comment-box__form').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      console.log('hello')
      var html = buildHTML(data);
      $('.comments').append(html);
      $('#comment_comment').val('');
      $('.submit-box__send-btn').prop('disabled', false);
    })
    .fail(function(){
      alert('メッセージの送信に失敗しました。')
    })
  })
})




$(function(){
  $('.mobile-comment-icon').click(function(){
    $('.mobile-comment-box').fadeToggle(500);
  });
});

