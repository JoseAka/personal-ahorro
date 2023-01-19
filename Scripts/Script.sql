select *
from parametrizado_conceptos -- conceptos_categorizdos?
order by `TIMESTAMP` desc;

CREATE TABLE totales (
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (ID)
);

-- totales
-- derivados
-- subderivado
-- conceptos_categorizados