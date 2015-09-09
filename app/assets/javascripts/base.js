jQuery(document).ready(function() {

  $('form').on('click', '.remove_fields', function(e){
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('tr').hide();

    Metronic.runResizeHandlers();
    return e.preventDefault();
  });

  $('form').on('click', '.add_fields', function(e){
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    
    $(this).closest('tr').before($(this).data('fields').replace(regexp, time));

    
    
    $(this).closest('tr').prev('tr').find('.select2me').select2({
      placeholder: "请选择",
      allowClear: true
    });

    $(this).closest('tr').prev('tr').find('.date-picker').datepicker({
      format: "yyyy-mm-dd",
      autoclose: true
    });
    Metronic.runResizeHandlers();
    return e.preventDefault();
  });

  $('form').on('click', '.add_row', function(e){
    $(this).closest('tr').before($(this).data('fields'));
    Metronic.runResizeHandlers();
    return e.preventDefault();
  });

  $('form').on('click', '.remove_row', function(e){
    $(this).closest('tr').remove();
    Metronic.runResizeHandlers();
    return e.preventDefault();
  });
});

function fillProvinces(province_control){
  $.ajax({
    url: "/ajax/districts/provinces"
  }).done(function(data){
    $(province_control).empty();
    $(province_control).select2("data", null);
    $(data).each(function(index, item){
      $(province_control).append(new Option(item));
    });
    $(province_control).change();
  });
}

function fillCities(province_control, city_control){
  $.ajax({
    url: "/ajax/districts/cities?province=" + $(province_control).val()
  }).done(function(data){
    $(city_control).empty();
    $(city_control).select2("data", null);
    $(data).each(function(index, item){
      $(city_control).append(new Option(item));
    });
    $(city_control).change();
  });
}

function fillRegions(province_control, city_control, region_control){
  $.ajax({
    url: "/ajax/districts/regions?province=" + $(province_control).val() + "&city=" + $(city_control).val()
  }).done(function(data){
    $(region_control).empty();
    $(region_control).select2("data", null);
    $(data).each(function(index, item){
      $(region_control).append(new Option(item));
    });
    $(region_control).change();
  });
}

Date.prototype.format = function(format) {
   var date = {
          "M+": this.getMonth() + 1,
          "d+": this.getDate(),
          "h+": this.getHours(),
          "m+": this.getMinutes(),
          "s+": this.getSeconds(),
          "q+": Math.floor((this.getMonth() + 3) / 3),
          "S+": this.getMilliseconds()
   };
   if (/(y+)/i.test(format)) {
          format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
   }
   for (var k in date) {
          if (new RegExp("(" + k + ")").test(format)) {
                 format = format.replace(RegExp.$1, RegExp.$1.length == 1
                        ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
          }
   }
   return format;
}

function openwindow(url, name, iwidth, iheight){
  var itop = (window.screen.height - 30 - iheight) / 2;
  var ileft = (window.screen.width - 10 - iwidth) / 2;
  window.open(url, name, 'height='+ iheight +',width='+ iwidth +',top='+ itop +',left='+ ileft +',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
}

function getUrlParams(){
  var args = new Object();   
  var query = location.search.substring(1);
  var pairs = query.split("&");
  for(var i = 0; i < pairs.length; i++){
    var pos = pairs[i].indexOf('=');
    if(pos == -1) continue; 
    var argname = pairs[i].substring(0,pos);
    var value = pairs[i].substring(pos + 1);
    args[argname] = unescape(value);
  }
  return args;
}