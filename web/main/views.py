from django.shortcuts import render
from django.http import HttpResponse,HttpResponseRedirect,Http404
from django.template import Context, Template,RequestContext, loader
from main.models import *

def home(request):
    tpl = "main.tpl"
    t =  loader.get_template(tpl)
    ruchar = [unichr(i) for i in xrange(0x410,0x430)]
    enchar = [unichr(i) for i in xrange(0x41,0x5b)]
    c = RequestContext(request, {'ruchar':ruchar,'enchar':enchar})
    return HttpResponse(t.render(c))

def save(request):
    tpl = "finish.tpl"
    t =  loader.get_template(tpl)
    participant =  Participant(comment=request.POST.get('comment','empty'),name=request.POST.get('name','unknown'))
    participant.save()
    ruchar = [unichr(i) for i in xrange(0x410,0x430)]
    enchar = [unichr(i) for i in xrange(0x41,0x5b)]
    data = {}
    for char in ruchar:
        color = request.POST.get(("g_%s" % char))
        if color:
            data[char]=color
    for char in enchar:
        color = request.POST.get(("g_%s" % char))
        if color:
            data[char]=color
    for char in xrange(0,10):
        color = request.POST.get(("g_%d" % char))
        if color:
            data[char]=color
    for grapheme,color in data.iteritems():
        print grapheme
        print color
        row = Table(participant=participant, symbol=grapheme, red=int(("0x%s" % color[0:2]), 16), green=int(("0x%s" % color[2:4]), 16), blue=int(("0x%s" % color[4:6]), 16))
        row.save()
    c = RequestContext(request, {})
    return HttpResponse(t.render(c))
