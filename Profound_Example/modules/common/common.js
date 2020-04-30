function common(req, res) {
  pjs.defineDisplay("display", "common/common.json");

  if (req) responseText = req;
  display.screen1.execute();

  try {
    if (query) {
      queries(commandText);
    } else if (command) {
      commands(commandText);
    } else if (program) {
      programs(commandText);
    }
  } catch (error) {
    common("error");
  }
}

function queries(commandText) {
  var orders = pjs.query(commandText);
  common(JSON.stringify(orders, null, 2));
}

function commands(commandText) {
  let jobs = pjs.runCommand(commandText);
  common("done");
}

function programs(commandText) {
  let ausgaben = [];
  for (i = 1; i < commandText; i++) {
    pjs.define("eingabe", {
      type: "packed decimal",
      length: 5,
      decimals: 0,
      initValue: i,
    });
    pjs.define("ausgabe", {
      type: "packed decimal",
      length: 20,
      decimals: 0,
    });
    pjs.call("FIBO", eingabe, ausgabe);
    ausgaben.push(ausgabe);
  }
  common(ausgaben.join());
}

exports.run = common;
