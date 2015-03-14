// alert("bukumap_test");

javascript:
(
	function(b)
	{
		var d=0;
		function a(g)
		{
			var j,i,f,e,h;
			form=document.createElement("form");
			form.action=g;
			form.method="POST";
			form.target="iframe"+d;
			form.acceptCharset="UTF-8";
			form.style.width=1;
			form.style.height=1;
			form.style.overflow="hidden";
			form.style.display="none";
			i=document.createElement("input");
			i.name="user-submitted-url";
			i.type="hidden";
			i.value=location.href;
			f=document.createElement("input");
			f.name="user-submitted-title";
			f.type="hidden";
			f.value=(document.title?document.title:"(無題)");
			e=document.createElement("input");
			e.name="user-submitted-post";
			e.type="hidden";
			e.value="Submit Post";
			form.appendChild(i);
			form.appendChild(f);
			form.appendChild(e);
			return form
		}
		function c(g)
		{
			document.body.appendChild(g);
			var f=document.createElement("iframe");
			f.name="iframe"+(d++);
			f.src="about:blank";
			f.width=1;
			f.height=1;
			f.style.display="none";
			var e=0;
			var h=f.onload=function()
			{
				if(e++===0)
					{
						setTimeout(
						function()
						{
							var i;
							if(document.charset)
								{
									i=document.charset;
									document.charset="UTF-8";
									g.submit();
									document.charset=i
								}
							else
								{
									if(document.characterSet)
										{
											i=document.characterSet;
											document.characterSet="UTF-8";
											g.submit();
											document.characterSet=i
										}
								}
						},
						0)
					}
				else
					{
						g.parentNode.removeChild(g);
						f.parentNode.removeChild(f);
						alert("投稿しました")
					}
			};
			if(document.all&&!document.addEventListener)
			{
				f.onreadystatechange=function()
				{
					if(this.readyState==="complete")
					{
						f.contentWindow.name=f.name;
						h()
					}
				}
			}document.body.appendChild(f)
		}c(a(b))
	}
)
("https://study-rails-ringohyo95.c9.io/bookmarks/new");




