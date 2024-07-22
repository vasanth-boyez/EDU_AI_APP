-- name: CreateTest :one
INSERT INTO test (name, bio)
VALUES ($1, $2)
RETURNING id, name, bio;