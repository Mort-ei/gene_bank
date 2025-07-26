-- Add a constraint for valid namespaces
ALTER TABLE ontology
ADD CONSTRAINT valid_namespace
CHECK (namespace IN (
    'biological_process',
    'molecular_function',
    'cellular_component'
));
