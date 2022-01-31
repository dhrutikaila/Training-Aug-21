$( "select" )
.change(function() {
  var str = "";
  $( "select option:selected" ).each(function() {
    str += $( this ).text() + ": ";
  });
  $( "span" ).text( str );
})
.trigger( "change" ); 