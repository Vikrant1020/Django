from django.http import HttpResponse
from django.shortcuts import render

def index(request):
	return HttpResponse('<h1>Welcome<h1> \n <a href="https://stackoverflow.com/questions/23439089/using-django-admin-on-windows-powershell">Power shell </a> ')


def ok(request):
	entery=(request.POST.get('text','default'))
	upper=(request.POST.get('upper','off'))
	remove=(request.POST.get('remove','off'))
	lineremove=(request.POST.get('lineremove','off'))
	spremove=(request.POST.get('spremove','off'))
	count=(request.POST.get('count','off'))
	
	
	print('upper caseing ',upper)
	print('punchuation remover',remove)
	print('new lone remover',lineremove)
	print('space remover',spremove)
	print('count charecter',count)

	if (upper=='on'):
		result=""
		for i in entery:
			result=result+i.upper()

		entery=result
		"""
		yes={'A':'Working on sentence',
		'B':result}
		return render(request,'text.html',yes)
		"""
	
	if(remove=='on'):
		result=""
		punc='''"'{}[].,,<;:>!@#$%^&*()'''
		for i in entery:
			if i not in punc:
				result=result+i
		entery=result
		"""
		yes={'A':'Working on sentence',
		'B':result}
		return render(request,'text.html',yes)
		"""
	
	if(lineremove=='on'):
		result=""
		for i in entery:
			if i != "/n":
				result=result+i
		entery=result
		"""
		yes={'A':'Working on sentence',
		'B':result}
		return render(request,'text.html',yes)
		"""

	if(spremove=='on'):
		result=""
		for i in entery:
			if i!=" ":
				result=result+i
		
		"""
		yes={'A':'Working on sentence',
		'B':result}
		return render(request,'text.html',yes)
		"""

	if(count=='on'):
		result=0
		for i in entery:
			if (i!="/n" and i!="/r" and i!=' '):
				result+=1
		yes={'A':'Working on sentence',
		'B':result}
		return render(request,'text.html',yes)
	
	if(spremove!='on'and count!='on'and remove!='on' and lineremove!='on' and upper!='on'):
		return HttpResponse("Please Select an option")

	yes={'A':'Working on sentence',
	'B':result}
	return render(request,'text.html',yes)
		


def html(request):
	return render(request,'html.html')

def word(request):	
	return render(request,'word.html')

def hell(request):
	return HttpResponse('HELL is on')

def ram(request):
	return HttpResponse('Ram was hear')
