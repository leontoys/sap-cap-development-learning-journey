const cds = require("@sap/cds");

// 1. CONFIGURE SQLite as the DB target
cds.env.requires.db = { kind: "sqlite", impl: "@cap-js/sqlite" };

// 2. DEPLOY to SQLite (creates tables + loads data)
cds.deploy();

// 3. START the server
cds.server();
