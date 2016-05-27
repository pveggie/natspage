// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$( document ).ready(function() {

  //****** Masonry layout
  $('#masonry-grid').isotope({
    itemSelector: '.grid-item',
    percentPosition: true,
    masonry: {
      columnWidth: '.grid-sizer',
      gutter:10
    }
  });

  //************ Filtering ***********

  // Get desired filter and filter accordingly
  // $('.filter-button-group').on( 'click', 'button', function() {
  //   var filterValue = $(this).attr('data-filter');
  //   console.log(filterValue);
  //   $('.filter-button-group').removeClass('active');
  //   $(this).addClass('active');
  //   filterPhotos(filterValue);
I
  // });

  // function filterPhotos(filterValue) {
  //   console.log(filterValue);
  //   // console.log($(.grid-item).data());
  //   //hide all
  //   $('.grid-item').addClass('hidden');
  //   // Show target tab-content (use class="hidden")
  //   $(filterValue).removeClass('hidden');
  // };

  //*********** Caption checker **************
  //
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
