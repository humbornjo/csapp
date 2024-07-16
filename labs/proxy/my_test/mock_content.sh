#!/bin/bash

# Function to generate HTTP/1.0 response
generate_response() {
  local content="$1"  # Content to be included in the body
  echo "HTTP/1.0 200 OK"
  echo "Content-Type: text/plain"
  echo "Content-Length: ${#content}"
  echo ""
  echo "$content"
  echo EOF
}

# Read content from a file (optional)
content=$(head -c 102400 /dev/urandom | base64)  # Generate 1kb random data (base64 encoded)
# Replace with your desired content or file path

# Generate and send response
response=$(generate_response "$content")
echo "$response"