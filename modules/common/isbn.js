const isbnLookup = pjs.wrap(require("node-isbn").resolve);

function isbn(parm1, parm2) {
  pjs.define("isbn", { type: "char", length: 20, refParm: parm1 });
  pjs.define("bookTitle", { type: "char", length: 1024, refParm: parm2 });

  try {
    const book = isbnLookup(isbn);
    console.log("called from rpg", book.title);
  } catch (e) {
    bookTitle = "Buch nicht gefunden";
  }

  return;
}

exports.default = isbn;
exports.run = isnb;
module.exports.parms = [
  { type: "char", length: 20 },
  { type: "char", length: 1024 },
];
