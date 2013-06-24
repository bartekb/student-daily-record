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
//= require jquery.handsontable.full
//= require twitter/bootstrap
//= require chosen-jquery
//= require bootstrap-wysihtml5
//= require bootstrap-wysihtml5/locales/pl-PL
//= require application
//= require start
//= require_tree .

jQuery(function ($) {

  var hiddenData = [
    ["", "Kia", "Nissan", "Toyota", "Honda"],
    ["2008", 10, 11, 12, 13],
    ["2009", 20, 11, 14, 13],
    ["2010", 30, 15, 12, 13]
  ];

  var $container = $("#dataTable");
  $container.handsontable({
    data: hiddenData,
    startRows: 5,
    startCols: 5,
    colHeaders: false,
    rowHeaders: true,
    columns: [
      {data: 0},
      {data: 2},
      {data: 3},
      {data: 4}
    ],
    minSpareRows: 1
  });

});