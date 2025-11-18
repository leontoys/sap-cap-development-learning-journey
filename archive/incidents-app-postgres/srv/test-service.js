const cds = require("@sap/cds");

module.exports = cds.service.impl(async function () {
  const db = await cds.connect.to("db");
  const res = await db.run("SELECT 1");
  console.log("CAP DB test:", res);
});
