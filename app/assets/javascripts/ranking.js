$(function() {
  var search_list = $('.contents');

  function appendRanking(ranking){ 
    var sum_quantity = 0;
    ranking.items.forEach(function(item){
      sum_quantity = sum_quantity + item.votes_length;
    }); 
                
    var html = '<div class="contents-box">' +
                '<p class="ranking-box__content">' + 
                  '<a href="/rankings/' + ranking.id + '" class= "ranking-box__content--link">' + ranking.name+ '</a>' +
                '</p>' +
                '<p class="vote-box__content">' +
                  sum_quantity +
                '</p>' +
                '<p class="author-box__content">' + 
                  ranking.user_name +
                '</p>' +
                '<p class="created-time-box__content">' +
                  ranking.time +
                '</p>' +
                '</div>'
    
    search_list.append(html);
  };

  function appendErrMsgToHTML(msg){
    var html = '<div class="contents-box">' + msg + '</div>'
    search_list.append(html);
  };


  var preinput = "";

  $(".search-form__input").on("keyup", function(){
    var input = $("#ranking-search-field").val();
    if(preinput !== input){
      $.ajax({
        type: 'GET',
        url: '/rankings',
        data: {keyword: input},
        dataType: 'json'
      })

      .done(function(rankings){
        $(".contents").empty();
        if (rankings.length !== 0){
          rankings.forEach(function(ranking){
            appendRanking(ranking);
          });
        }
        else {
          appendErrMsgToHTML("一致するランキングはありません")
        }
      })

      .fail(function(){
        alert('ランキング検索に失敗しました');
      });

      preinput = input
    };
  });
});

// $(function(){
//   var $win = $(window),
//       $main = $('.header-wrapper'),
//       $nav = $('.header'),
//       navHeight = $nav.outerHeight(),
//       navPos = $nav.offset().top,
//       fixedClass = 'is-fixed';

//   $win.on('load scroll', function() {
//     var value = $(this).scrollTop();
//     if(value > navPos) {
//       $nav.addClass(fixedClass);
//       $main.scss('margin-top', navHeight);
//     } else {
//       $nav.removeClass(fixedClass);
//       $main.scss('margin-top', '0')
//     }
//   });
// });