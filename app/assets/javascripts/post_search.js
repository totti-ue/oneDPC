$(function(){

  var search_list = $(".box-list");

  function appendPost(post) {
    var html = `
                <a href="/posts/${post.id}" class="a-post">
                  <li class="a-post-img-box">
                    <img src="${post.image.url}" id="a-post-img">
                    <div class="a-post__detail">
                      <div class="a-post__detail__title">
                        ${post.title}
                      </div>
                      <div class="a-post__detail__post-user">
                        by
                        ${post.user.nickname}
                      </div>
                    </div>
                  </li>
                </a>
                `
    search_list.append(html);
  }

  function appendErrMsgToHTML(msg) {
    let input = $('.search-input').val();
    var html = `タイトル：<span style="font-weight:bold;">${input} </span>に${ msg }`
    search_list.append(html);
  }

  $('.search-input').on('keyup', function(){
    let input = $('.search-input').val();
    $('.search-keyword').text(input);
    $.ajax({
      type: 'GET',
      url: '/posts/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(posts){
      $('.box-list').empty();
      if(posts.length !== 0) {
        posts.forEach(function(post){
          appendPost(post);
        });
      }
      else {
        appendErrMsgToHTML("一致する投稿はありません");
      }
    });
  });
});


$(function(){

  var search_list = $(".box-list");

  function appendPost(post) {
    var html = `
                <a href="/posts/${post.id}" class="a-post">
                  <li class="a-post-img-box">
                    <img src="${post.image.url}" id="a-post-img">
                    <div class="a-post__detail">
                      <div class="a-post__detail__title">
                        ${post.title}
                      </div>
                      <div class="a-post__detail__post-user">
                        by
                        ${post.user.nickname}
                      </div>
                    </div>
                  </li>
                </a>
                `
    search_list.append(html);
  }

  function appendErrMsgToHTML(msg) {
    let input = $('.mobile-search__input').val();
    var html = `タイトル：<span style="font-weight:bold;">${input} </span>に${ msg }`
    search_list.append(html);
  }

  $('.mobile-search__input').on('keyup', function(){
    let input = $('.mobile-search__input').val();
    $('.mobile-search-keyword').text(input);
    $.ajax({
      type: 'GET',
      url: '/posts/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(posts){
      $('.box-list').empty();
      if(posts.length !== 0) {
        posts.forEach(function(post){
          appendPost(post);
        });
      }
      else {
        appendErrMsgToHTML("一致する投稿はありません");
      }
    });
  });
});




