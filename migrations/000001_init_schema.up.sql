CREATE TABLE IF NOT EXISTS vacancies (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    company VARCHAR(255) NOT NULL,
    url TEXT NOT NULL UNIQUE,
    direction VARCHAR(50) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_vacancies_direction ON vacancies(direction);

CREATE INDEX IF NOT EXISTS idx_vacancies_company ON vacancies(company);