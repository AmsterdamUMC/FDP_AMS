# Create the Dockerfile
cat > bootstrap/graph-db-repo-manager/Dockerfile << 'EOF'
FROM alpine:3.14

RUN apk add --no-cache curl jq

COPY create-repositories.sh /create-repositories.sh
RUN chmod +x /create-repositories.sh

CMD ["/create-repositories.sh"]
EOF
