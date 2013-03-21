// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery-star-rating
//= require_tree .



(function($){
  var pr = 0, bgWidth = true, bgResize;

  bgResize = function(){
    var wr = $(window).width() / $(window).height();

    if(wr > pr && !bgWidth) {
      $('#bgimg').css('width', '100%').css('height', '');
      bgWidth = true;
    } else if(wr < pr && bgWidth) {
      $('#bgimg').css('height', '100%').css('width', '');
      bgWidth = false;
    }
  };


  $(document).ready(function() {
    $('.boxes').mouseover(function(){
      $('.pic', this).addClass('hidden');
      $('p.words', this).removeClass('hidden');
      });
    $('.boxes').mouseout(function(){
      $('.pic', this).removeClass('hidden');
      $('p.words', this).addClass('hidden');
      });



    /*$(".dialog").dialog({
      autoOpen: false,
      modal: true,
      height: 500,
      width: 550,
      show: {
        effect: "clip",
        duration: 750
      },
      hide: {
        effect: "clip",
        duration: 750
      }
    });

    $("#review").click(function() {
      $(".dialog").dialog( "open" );
    });*/

    $( "#accordion" ).accordion({ collapsible: true, active: false });

    $('.datatable').dataTable({
  "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
  "sPaginationType": "bootstrap"
});

    var img = $('#bgimg');
    if(img.height()) {
      pr = $('#bgimg').width() / $('#bgimg').height();
      bgResize();
    } else {
      img.load(function(){
        pr = $('#bgimg').width() / $('#bgimg').height();
        bgResize();
      });
    }

    $(window).resize(bgResize);
    prettyPrint();
  });
})(jQuery);



















