// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$( document ).ready(function() {

  $(function(){

    $('#masonry-grid').masonry({
      itemSelector: '.grid-item',
      columnWidth: function( containerWidth ) {
        console.log(containerWidth);
        if (containerWidth > 750) {
        return containerWidth / 3;
      } else {
        return containerWidth;
      }
      },
      isFitWidth: true,
    });
  });

  String.prototype.isEmpty = function() {
    return (this.length === 0 || !this.trim());
  };

  $(".photo-holder").mouseover(function(event){
    // Show caption on hover
    target = $(this).children('#photo-caption')
    target.removeClass('hidden');
  });

  $(".photo-holder").mouseleave(function(event){
    // Remove caption when not hovering
    $(this).children('#photo-caption').addClass('hidden');
  });

});
