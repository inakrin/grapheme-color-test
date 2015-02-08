{% extends "base.tpl" %}
{% load get_range %}


{%block body%}
    <div class="jumbotron">
      <div class="container">
        <h1>Соответствие графемы и цвета</h1>
        <p>Выберите пожалуйста ваше соответствие графемы и цвета и по желанию укажите имя и комментарий.</p>
        <p>Для выбора цвета достаточно щелкнуть на символ</p>
      </div>
    </div>
<form id="mainform" method="POST" action="/save/">
{% csrf_token %}
    <div class="container">
    <div class="row">
    <div class="col-xs-1 col-md-5">
    <button type="button" class="btn btn-default btn-ru" aria-label="Добавить буквы русского алфавита">
  <span class="glyphicon glyphicon-font" aria-hidden="true" style="color:purple;"></span>&nbsp;&nbsp;Добавить буквы русского алфавита
</button>
</div>
<div class="col-xs-1 col-md-5">
<button type="button" class="btn btn-default btn-eng" aria-label="Добавить буквы английского алфавита">
  <span class="glyphicon glyphicon-font"  aria-hidden="true" style="color:yellow;"></span>&nbsp;&nbsp;Добавить буквы английского алфавита
</button>
</div>
    </div>
<div class="row" >
{% for i in 10|getrange %}
<div class="col-xs-1 col-md-1"><h2 class="grp">{{i}}</h1></div>
{% endfor %}
</div>
<div class="row rurow">
{% for i in ruchar %}
<div class="col-xs-1 col-md-1"><h2 class="grp">{{i}}</h1></div>
{% endfor %}
</div>
<div class="row engrow">
{% for i in enchar %}
<div class="col-xs-1 col-md-1"><h2 class="grp">{{i}}</h1></div>
{% endfor %}
</div>

  <div class="form-group">
    <input type="text" class="form-control" id="nameinput" placeholder="Имя">
  </div>
  <div class="form-group">
 <textarea name="comment" class="form-control" rows="3" placeholder="Комментарий"></textarea>
  </div>
  <button type="submit" class="btn btn-default">Отправить</button>
</form>



<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
      <div class="row">
<div class="col-xs-1 col-md-6">
  <div style="font-size:300px;text-align:center;" class="grapheme"></div>
</div>
<div class="col-xs-1 col-md-6">
  <div class="colorp" style="padding-top:100px"></div>
</div>
</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
      </div>
    </div>
  </div>
</div>
{%endblock%}
