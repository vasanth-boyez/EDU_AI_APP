CREATE TABLE test (
    id BIGSERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    bio TEXT
);

CREATE INDEX IF NOT EXISTS idx_test_id ON test(id);