<html>
{% load bootstrap3 %}
<head>
<script type="text/javascript" src="{{ STATIC_URL }}js/jquery.js" /></script>
{% bootstrap_css %}
{% bootstrap_javascript %}

<script type="text/javascript" src="{{ STATIC_URL }}/js/js/colorpicker.js"></script>
<script>
$(function(){
$('.btn-eng').click(function(){
$('.engrow').toggle();
});
$('.btn-ru').click(function(){
$('.rurow').toggle();
});
$('.grp').click(function(){
window.currentgrapheme = this;
$(".grapheme").css('color', $(this).css('color'));
$('#myModal').modal('toggle');
$('#myModal').find(".grapheme").html($(this).html());
});
$('.colorp').ColorPicker({
	color: '#0000ff',
	flat:true,
	/*onShow: function (colpkr) {
		$(colpkr).fadeIn(500);
		return false;
	},
	onHide: function (colpkr) {
		$(colpkr).fadeOut(500);
		return false;
	},*/
	onChange: function (hsb, hex, rgb) {
		//console.log(this);
		var grph_i ='g_' + $(".grapheme").html()
		if($("input[name="+grph_i+"]").length==0){
			$("#mainform").append("<input type='hidden' name='"+grph_i+"'/>");
		}
		$("input[name="+grph_i+"]").val(hex)
		$(window.currentgrapheme).css('color', '#' + hex);
		$(".grapheme").css('color', '#' + hex);
	}
});
});
</script>
<link href="{{ STATIC_URL }}/js/css/colorpicker.css" type="text/css"  rel="stylesheet" />
<style type="text/css">
.grp, .grapheme {
color:lightgray;
}
h2 {
cursor:pointer;
}
.engrow,.rurow {
display:none;
}
</style>
<title>Странца сбора информации для синестетов с синестезией графема → цвет.</title>
</head>
<body>
{% block body %}

{% endblock %}
</body>
</html>
