#encoding: UTF-8

def mk_link(url, txt, htmlclass='')
	if htmlclass == '' then
		"<a href=\"#{$blog_root}/#{url}\">#{txt}</a>"
	else
		"<a href=\"#{$blog_root}/#{url}\" class=\"#{htmlclass}\">#{txt}</a>"
	end
end

def mk_abs_link(url,txt, htmlclass='')
	if htmlclass == '' then
		"<a href=\"/#{url}\">#{txt}</a>"
	else
		"<a href=\"/#{url}\" class=\"#{htmlclass}\">#{txt}</a>"
	end
end
