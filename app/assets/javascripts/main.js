jQuery(function($){
  $('.tab').click(function(){
      $('.is-active').removeClass('is-active');
      $(this).addClass('is-active');
      $('.is-show').removeClass('is-show');
      // クリックしたタブからインデックス番号を取得
      const index = $(this).index();
      // クリックしたタブと同じインデックス番号をもつコンテンツを表示
      $('.panel').eq(index).addClass('is-show');
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
    // $('nav').toggleClass('open');
    // $('.up_text').remove();
    // $('.btn_text').show('up_text');
  });
});

