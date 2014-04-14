// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require turbolinks
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrap-datepicker
//= require_tree .
//<script type="text/javascript">
  $(document).ready(function(){
  	//$.fn.datepicker.defaults.format = "mm/dd/yyyy";
    $('[data-behaviour~=datepicker]').datepicker({
    	  format: 'yyyy-mm-dd',
    	  autoclose: true,
    	  todayHighlight: true
    });
  })



//</script>