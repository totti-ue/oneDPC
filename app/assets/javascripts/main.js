$(function($){
  $('.tab').click(function(){
    $('.is-active').removeClass('is-active');
    $(this).addClass('is-active');
    $('.is-show').removeClass('is-show');
    const index = $(this).index();
    $('.panel').eq(index).addClass('is-show');
  });
});

$(function($){
  $('.mobile-tab').click(function(){
    $('.is-mobile-active').removeClass('is-mobile-active');
    $(this).addClass('is-mobile-active');
    $('.is-mobile-show').removeClass('is-mobile-show');
    const index = $(this).index();
    $('.mobile-panel').eq(index).addClass('is-mobile-show');
  });
});



$(function(){
  $('.btn_menu').click(function(){
    if (!$('nav').hasClass('open')){
      $('nav').toggleClass('open');
      $('.btn_text').remove();
      $('.btn_menu').append(`<span class="btn_text"><i class="fa fa-times-circle"></i></span>`);

    } else {
      $('nav').toggleClass('open');
      $('.btn_text').remove();
      $('.btn_menu').append(`<span class="btn_text"><i class="fa fa-bars"></i></span>`);
    }
  });
});


$(function(){
  $('.mobile-top').addClass('icon-show');
  $('.click-menu').click(function(){
    if (!$('.mobile-top').hasClass('icon-show')){
      $('.mobile-top').toggleClass('icon-show');
      $('.click-text').remove();
      $('.click-menu').append(`<span class="click-text"><i class="fa fa-chevron-up"></i></span>`)
    } else {
      $('.mobile-top').toggleClass('icon-show');
      $('.click-text').remove();
      $('.click-menu').append(`<span class="click-text"><i class="fa fa-chevron-down"></i></span>`)
    }
  })
})

$(function(){
  $('.best-shot-details-show').addClass('icon-show');
  $('.open-details').click(function(){
    if (!$('.best-shot-details-show').hasClass('icon-show')){
      $('.best-shot-details-show').toggleClass('icon-show');
      $('.open-text').remove();
      $('.open-details').append(`<span class="open-text">投稿詳細を見る<br><i class="fa fa-chevron-down"></i></span>`)
    } else {
      $('.best-shot-details-show').toggleClass('icon-show');
      $('.open-text').remove();
      $('.open-details').append(`<span class="open-text">閉じる<br><i class="fa fa-chevron-up"></i></span>`)
    }
  })
})


$(function(){
  $('.inquiry-form-btn').click(function(){
    $('.inquiry-form').fadeToggle(500);
  });
});


