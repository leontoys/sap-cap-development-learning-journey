// cds.requires.js
module.exports = {
  db: {
    kind: "postgres",
    credentials: {
      host: "aws-1-us-east-2.pooler.supabase.com",
      port: 6543,
      user: "postgres.aetjsfqozmfvsntgvopd",
      password: "kVKMgHYPC8m3Jp",
      database: "postgres",
      ssl: { rejectUnauthorized: false },
      pool: { min: 0, max: 5 },
      connect_timeout: 10,
    },
  },
};
