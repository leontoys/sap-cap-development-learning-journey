// test-pg.js
const { Pool } = require("pg");

const pool = new Pool({
  connectionString:
    "postgresql://postgres.aetjsfqozmfvsntgvopd:kVKMgHYPC8m3Jp@aws-1-us-east-2.pooler.supabase.com:6543/postgres",
  ssl: {
    rejectUnauthorized: false, // <-- critical to bypass self-signed cert issue
  },
  max: 2,
});

(async () => {
  try {
    const res = await pool.query("SELECT 1");
    console.log("Success:", res.rows);
    await pool.end();
  } catch (err) {
    console.error(err);
  }
})();
