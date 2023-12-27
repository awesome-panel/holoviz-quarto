import html
from io import StringIO
import sys  

from panel.io.convert import script_to_html
from panel.io.resources import set_resource_mode

CLASS="panel-app"
ALLOW="accelerometer;autoplay;camera;document-domain;encrypted-media;fullscreen;gamepad;geolocation;gyroscope;layout-animations;legacy-image-formats;microphone;oversized-images;payment;publickey-credentials-get;speaker-selection;sync-xhr;unoptimized-images;unsized-media;screen-wake-lock;web-share;xr-spatial-tracking"

def script_to_iframe(code: str, runtime: str="pyscript", class_: str=CLASS, allow: str=ALLOW)->str:
    """Converts the code to a valid iframe for embedding"""
    if runtime=="pyodide-worker":
        # The pyodide-worker runtime generates an both a html and a js file
        raise ValueError("pyodide-worker runtime is not supported!")
    with set_resource_mode('cdn'):
        ht, _ = script_to_html( 
            StringIO(script), runtime=runtime
        )
    ht = html.escape(ht)
    return f"""<iframe frameborder="0" srcdoc="{ht}" class="{class_}" onload="resizePanelApp(this)" allow="{ALLOW}"></iframe>"""

if __name__=="__main__":
    script = sys.stdin.read()
    iframe = script_to_iframe(script)
    print(iframe)