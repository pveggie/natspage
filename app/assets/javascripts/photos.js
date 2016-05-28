// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$( document ).ready(function() {

  //****** Masonry layout & initialising for Isotope
  var $grid = $('#masonry-grid').isotope({
    itemSelector: '.grid-item',
    percentPosition: true,
    masonry: {
      columnWidth: '.grid-sizer',
      gutter:10
    }
  });

  //************ Filtering ***********

  // display photos according to button clicked
  $('.filter-tabs').on( 'click', '.tab', function() {
    var filterValue = $( this ).attr('data-filter');

    $grid.isotope({ filter: filterValue });
  });

  // change is-checked class on buttons
  $('.filter-tabs').each( function( i, tab ) {
    var $tab = $( tab );
    $tab.on( 'click', '.tab', function() {
      $tab.find('.active').removeClass('active');
      $( this ).addClass('active');
    });
  });


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
