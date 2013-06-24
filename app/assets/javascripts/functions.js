var initChoosen, initWysiHTML, initPopovers;

initChoosen = function() {
  return $('.chzn-select').chosen({
    no_results_text: 'Nic nie znaleziono dla'
  });
};

initWysiHTML = function() {
  return $(".wysihtml5").each(function(i, elem) {
    return $(elem).wysihtml5();
  });
};

initPopovers = function() {
  return $('.popovered').popover();
};