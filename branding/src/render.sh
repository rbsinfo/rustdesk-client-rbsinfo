set -e
apt-get update -qq >/dev/null && apt-get install -y -qq libcairo2 fontconfig >/dev/null
pip install -q cairosvg fonttools brotli pillow 2>/dev/null
mkdir -p /root/.fonts
cd /w/src
python - <<'PY'
from fontTools.ttLib import TTFont
from fontTools.varLib import instancer
for src,name in [("geist.woff2","Geist"),("geist-mono.woff2","Geist Mono")]:
    f=TTFont(src); print(src, "fvar" in f)
    if "fvar" in f:
        for w in (400,600,700):
            g=instancer.instantiateVariableFont(TTFont(src),{"wght":w},updateFontNames=True)
            g.flavor=None; g.save(f"/root/.fonts/{name.replace(' ','')}-{w}.ttf")
    else:
        f.flavor=None; f.save(f"/root/.fonts/{name.replace(' ','')}.ttf")
PY
fc-cache -f >/dev/null; fc-list | grep -i geist
cd /w/src
for n in icon logo privacy; do python -c "import cairosvg;cairosvg.svg2png(url='$n.svg',write_to='../$n.png')"; done
python -c "
from PIL import Image
Image.open('../icon.png').save('../icon.ico',sizes=[(16,16),(24,24),(32,32),(48,48),(64,64),(128,128),(256,256)])
"
