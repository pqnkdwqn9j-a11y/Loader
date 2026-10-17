import base64
W='/home/user/auh/preview/menu/'
css=open(W+'style.css').read(); body=open(W+'body.html').read(); js=open(W+'app.js').read()
sprite='data:image/png;base64,'+base64.b64encode(open('/home/user/burmalda_icons.png','rb').read()).decode()
face='data:image/jpeg;base64,'+base64.b64encode(open('/home/user/auh/preview/menu/face.jpg','rb').read()).decode()
html=f'''<!DOCTYPE html>
<html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"><title>Burmalda.hook - menu concept</title>
<style>:root{{--sprite:url("{sprite}");--face:url("{face}")}}
{css}</style></head><body>
{body}
<script>{js}</script>
</body></html>'''
open('/home/user/burmalda_menu_demo.html','w').write(html); print(len(html))
