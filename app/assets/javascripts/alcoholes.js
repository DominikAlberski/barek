
$(document).ready(function() {
  console.log('Działam');
  var kind = $('#alcohol_kind');
  var vodka = $('.vodka');
  var liqueur = $('.liqueur');
  var wine = $('.wine');
  var whiskey = $('.whiskey');

  // do poprawy:

  kind.change(function(e) {
    var chosenIndex = kind[0].options.selectedIndex;
    var selectedValue = kind[0].options[chosenIndex].value
    if (selectedValue == 'vodka') { 
      vodka.removeClass('hidden');
      wine.addClass('hidden');
      liqueur.addClass('hidden');
      whiskey.addClass('hidden');
    }    
    else if (selectedValue == 'wine') { 
      vodka.addClass('hidden');
      wine.removeClass('hidden');
      liqueur.addClass('hidden');
      whiskey.addClass('hidden');
    }
    else if (selectedValue == 'liqueur') { 
      vodka.addClass('hidden');
      wine.addClass('hidden');
      liqueur.removeClass('hidden');
      whiskey.addClass('hidden');
    }
    else if (selectedValue == 'whiskey') { 
      vodka.addClass('hidden');
      wine.addClass('hidden');
      liqueur.addClass('hidden');
      whiskey.removeClass('hidden');
    }
    else if (selectedValue == 'other' || null) {
      vodka.addClass('hidden');
      wine.addClass('hidden');
      liqueur.addClass('hidden');
      whiskey.addClass('hidden');
    }
  });
console.log('koniec kodu');
});
