# Create the script
cat > bootstrap/graph-db-repo-manager/create-repositories.sh << 'EOF'
#!/bin/sh

# Wait for GraphDB to be ready
echo "Waiting for GraphDB to be ready..."
until curl -s "${GRAPH_DB_URL}" > /dev/null; do
    sleep 5
done

# Create CDE repository
curl -X POST \
    -H "Content-Type: application/json" \
    -u "${GRAPH_DB_ADMIN_USERNAME}:${GRAPH_DB_ADMIN_PASSWORD}" \
    "${GRAPH_DB_URL}/rest/repositories" \
    -d '{"id":"cde","type":"free","label":"CDE Repository"}'

# Create FDP repository
curl -X POST \
    -H "Content-Type: application/json" \
    -u "${GRAPH_DB_ADMIN_USERNAME}:${GRAPH_DB_ADMIN_PASSWORD}" \
    "${GRAPH_DB_URL}/rest/repositories" \
    -d '{"id":"fdp","type":"free","label":"FDP Repository"}'

echo "Repositories created successfully"
EOF

chmod +x bootstrap/graph-db-repo-manager/create-repositories.sh
