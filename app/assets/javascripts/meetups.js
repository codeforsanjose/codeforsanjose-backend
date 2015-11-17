var MEETUP_URL = "";
var htmlString = "";
      
$(document).ready(function(){  

  var MEETUP_URL = "http://api.meetup.com/2/events?key=d30645f3c726b341f2a6614d4f4b37&offset=0&format=json&limited_events=False&group_urlname=Code-for-San-Jose&sign=true&photo-host=public&page=20&fields=&order=time&desc=false&status=upcoming&callback=";

  function convert(epoch){
    var myDate = new Date(epoch);
    return myDate.toLocaleString();

   }

  //Do not like my htmlstrings. Will have to convert to lists. Add Classes. Or convert to Angular
  $.ajax({
    url: MEETUP_URL,
    type: "GET",
    dataType: 'jsonp',
    cache: false,
    success: function(response){  
      $.each(response.results, function (i, item) {          
        htmlString += '<h5><a href=\"www.google.com\"' + item.link + '" target="_blank">' + item.name + '</a></h5>';
        htmlString += '<p> Address: ' + item.venue.address_1 + '</br></p>' ;
        htmlString += '<p>'+ convert(item.time)+'</br></p>';
        htmlString += '<hr>';
        $("ol").append(htmlString);
        htmlString="";           
        // console.log(response.results, i, item );
      }); /* end of .each item*/
    } /*end of sucess response*/
  }); /*ajax request ends */

});
