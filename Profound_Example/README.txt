Installation:	"npm install"

Config.js anpassen:
...
  "pathlist": [
    "pjssamples",
	"common"
  ],
  "initialModules": {
    "/hello": "pjssamples/hello",
    "/hello2": "pjssamples/hello2",
    "/connect4": "pjssamples/connect4",
    "/upload": "pjssamples/upload",
	"/common": "common/common"
  },
...

Profound Instanz starten: "node start"

"http://localhost:8081/common" im Browser öffnen

Für den Zugriff auf Ihre IBM i müssen Credentials und die Adresse der IBM i eingetragen werden.
https://docs.profoundlogic.com/display/PUI/Setting+up+a+Connection+to+a+Remote+IBM+i+Instance