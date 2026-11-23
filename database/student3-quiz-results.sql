-- MajorMatch: Student 3
-- Quiz results table

CREATE TABLE IF NOT EXISTS quiz_results (
    session_id VARCHAR(64) NOT NULL,
    answers_json LONGTEXT NOT NULL,
    cs_score INT NOT NULL DEFAULT 0,
    it_score INT NOT NULL DEFAULT 0,
    ce_score INT NOT NULL DEFAULT 0,
    dims_json LONGTEXT NOT NULL,
    answered INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (session_id)
) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4;
