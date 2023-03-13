# unoserver node wrapper

## Run Image
```
docker run -p 5000:5000 --name unoserver philiplehmann/unoserver:latest
```

## Convert file
```
curl -X POST \
  -H 'content-type: application/x-www-form-urlencoded' \
  --data-binary "@path/to/my/document.docx" --output document.pdf \
  'http://localhost:5000/convert'
```

## Ports
 - HTTP 5000
