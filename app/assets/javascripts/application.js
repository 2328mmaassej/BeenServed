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

/*
 * This is a manifest file that'll be compiled into application.css, which will include all the files
 * listed below.
 *
 * Any CSS and SCSS file within this directory, lib/assets/stylesheets, vendor/assets/stylesheets,
 * or vendor/assets/stylesheets of plugins, if any, can be referenced here using a relative path.
 *
 * You're free to add application-wide styles to this file and they'll appear at the top of the
 * compiled file, but it's generally better to create a new file per style scope.
 *
 *= require_self
 *= require_tree .
 */

/* http://meyerweb.com/eric/tools/css/reset/
   v2.0 | 20110126
   License: none (public domain)
*/

= require_self
= require_tree .

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



















