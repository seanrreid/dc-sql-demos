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

