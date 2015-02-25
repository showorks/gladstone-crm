function searchFairsFormatResult(fair) {
  var markup
  markup = "<b>" + fair.fair_name + '</b><br><small>' +
   "Location: " + fair.fair_state;

  if (fair.purchased == true) {
    markup += "&nbsp;&bull;&nbsp;SW Customer: Yes";
  } else {
    markup += "&nbsp;&bull;&nbsp;SW Customer: No";
  }

  if (fair.showorks_web_user == true) {
    markup += "&nbsp;&bull;&nbsp;SW Web: Yes";
  } else {
    markup += "&nbsp;&bull;&nbsp;SW Web: No";
  }
  markup += "</small>";
  return markup;
}

function searchFairsFormatSelection(fair) {
   return fair.fair_name;
}


function searchPhonesFormatResult(fair) {
  var markup
  markup = "<b>" + fair.contact_name + '</b><br><small>';

  markup += "Phone 1: " + fair.contact_phone_1 + "&nbsp;&bull;&nbsp;Phone 2: " + fair.contact_phone_2 + "&nbsp;&bull;&nbsp;Cell: " + fair.contact_phone_cell + "<br>";

  markup += "Fair: " + fair.fair_name + "&nbsp;&bull;&nbsp;Location: " + fair.fair_state;

  if (fair.purchased == true) {
    markup += "&nbsp;&bull;&nbsp;SW Customer: Yes";
  } else {
    markup += "&nbsp;&bull;&nbsp;SW Customer: No";
  }

  if (fair.showorks_web_user == true) {
    markup += "&nbsp;&bull;&nbsp;SW Web: Yes";
  } else {
    markup += "&nbsp;&bull;&nbsp;SW Web: No";
  }
  markup += "</small>";
  return markup;
}

function searchPhonesFormatSelection(fair) {
   return fair.contact_name;
}


function searchContactsFormatResult(fair) {
  var markup
  markup = "<b>" + fair.contact_name + '</b><br><small>';

  markup += "Phone 1: " + fair.contact_phone_1 + "&nbsp;&bull;&nbsp;Phone 2: " + fair.contact_phone_2 + "&nbsp;&bull;&nbsp;Cell: " + fair.contact_phone_cell + "<br>";

  markup += "Fair: " + fair.fair_name + "&nbsp;&bull;&nbsp;Location: " + fair.fair_state;

  if (fair.purchased == true) {
    markup += "&nbsp;&bull;&nbsp;SW Customer: Yes";
  } else {
    markup += "&nbsp;&bull;&nbsp;SW Customer: No";
  }

  if (fair.showorks_web_user == true) {
    markup += "&nbsp;&bull;&nbsp;SW Web: Yes";
  } else {
    markup += "&nbsp;&bull;&nbsp;SW Web: No";
  }
  markup += "</small>";
  return markup;
}

function searchContactsFormatSelection(fair) {
   return fair.contact_name;
}
