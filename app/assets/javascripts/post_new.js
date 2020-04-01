// 日付を取得してテーマを自動入力
$(function($){
  $(window).on('load',function(){
    let url = location.href
    let today = new Date();
    let wday = today.getDay();
    let day = today.getDate();
    if(url == "http://localhost:3000/posts/new"){
      if(wday == 0){
        $('#post_theme_ids').val(wday)
      }else{
        $('#post_theme_ids').val(day)
      }
    }
  });
});



