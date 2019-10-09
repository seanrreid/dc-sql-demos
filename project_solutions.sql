-- Perform a left outer join from the project table to the project_users_tech table - which projects has no associated tech?
SELECT
    *
FROM
    project
    LEFT OUTER JOIN project_uses_tech ON project_uses_tech.project_id = project.id;

-- Based on the previous query, get the count of the number of project that use each tech.
SELECT
    project.*,
    count(project_uses_tech.tech_id)
FROM
    project
    LEFT OUTER JOIN project_uses_tech ON project_uses_tech.project_id = project.id
GROUP BY
    project.id;

-- Perform a left outer join from the tech table to the project_uses_tech table - which techs has no associated project?
SELECT
    name,
    count(tech_id)
FROM
    tech
    LEFT OUTER JOIN project_uses_tech ON project_uses_tech.tech_id = tech.id
GROUP BY
    tech.id;

-- Based on the previous query, get the count of the number of techs used by each project.
SELECT
    name,
    count(tech_id)
FROM
    tech
    LEFT OUTER JOIN project_uses_tech ON project_uses_tech.tech_id = tech.id
GROUP BY
    tech.id;

-- which ones have zero counts?
SELECT
    *
FROM (
    SELECT
        name,
        count(tech_id)
    FROM
        tech
    LEFT OUTER JOIN project_uses_tech ON project_uses_tech.tech_id = tech.id
GROUP BY
    tech.id) x
WHERE
    count = 0;

-- or
SELECT
    name,
    tech_id
FROM
    tech
    LEFT OUTER JOIN project_uses_tech ON project_uses_tech.tech_id = tech.id
WHERE
    project_uses_tech.tech_id IS NULL
    -- 3-way join
    SELECT
        *
    FROM
        project
    LEFT OUTER JOIN project_uses_tech ON project_uses_tech.project_id = project.id
    LEFT OUTER JOIN tech ON project_uses_tech.tech_id = tech.id;

-- distinct techs that have some project
SELECT DISTINCT
    (tech.name)
FROM
    project
    INNER JOIN project_uses_tech ON project_uses_tech.project_id = project.id
    INNER JOIN tech ON project_uses_tech.tech_id = tech.id;

-- distinct techs that have no project
SELECT DISTINCT
    (tech.name)
FROM
    project
    RIGHT OUTER JOIN project_uses_tech ON project_uses_tech.project_id = project.id
    RIGHT OUTER JOIN tech ON project_uses_tech.tech_id = tech.id
WHERE
    project_id IS NULL;

-- Order the projects by how many tech it uses.
SELECT
    *
FROM (
    SELECT
        project.id,
        project.name,
        count(project_uses_tech.tech_id)
    FROM
        project
    LEFT OUTER JOIN project_uses_tech ON project_uses_tech.project_id = project.id
GROUP BY
    project.id) project_by_tech_count
ORDER BY
    count DESC;

-- you actually don't need a subselect:
SELECT
    project.id,
    project.name,
    count(project_uses_tech.tech_id) AS my_count
FROM
    project
    LEFT OUTER JOIN project_uses_tech ON project_uses_tech.project_id = project.id
GROUP BY
    project.id
ORDER BY
    my_count;

