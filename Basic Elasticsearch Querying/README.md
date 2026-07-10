# 🧪 Lab 03: Basic Elasticsearch Querying

## 📌 Lab Summary

In this lab, basic querying operations were performed in Elasticsearch using the REST API. A new index named **products** was created, sample documents were indexed, and various search queries were executed to retrieve and filter data. The lab demonstrated how to list indices, retrieve all documents, limit search results, and perform keyword-based searches using query parameters.

---

## 🎯 Objectives

- Understand the fundamentals of Elasticsearch querying.
- Create and manage an Elasticsearch index.
- Insert sample JSON documents into an index.
- List available indices using the Cat API.
- Retrieve indexed documents using the Search API.
- Refine search results using query parameters.

---

## 🖥️ Lab Environment

| Component | Details |
|-----------|----------|
| Operating System | Ubuntu Linux |
| Elasticsearch Version | 9.x |
| Interface | Terminal (cURL) |
| Protocol | HTTPS REST API |

---

# ⚙️ Lab Tasks

## Step 1 – Verify Elasticsearch

Confirm that the Elasticsearch service is running.

```bash
curl -k -u elastic https://localhost:9200
```

---

## Step 2 – Create an Index

Create a new index named **products**.

```bash
curl -k -u elastic -X PUT https://localhost:9200/products
```

---

## Step 3 – Index Sample Documents

Insert sample documents into the **products** index.

### Document 1

```bash
curl -k -u elastic -X POST https://localhost:9200/products/_doc/1 \
-H "Content-Type: application/json" \
-d '{
"name":"Laptop",
"brand":"Dell",
"price":1200
}'
```

### Document 2

```bash
curl -k -u elastic -X POST https://localhost:9200/products/_doc/2 \
-H "Content-Type: application/json" \
-d '{
"name":"Mouse",
"brand":"Logitech",
"price":25
}'
```

### Document 3

```bash
curl -k -u elastic -X POST https://localhost:9200/products/_doc/3 \
-H "Content-Type: application/json" \
-d '{
"name":"Keyboard",
"brand":"HP",
"price":40
}'
```

---

## Step 4 – Refresh the Index

Refresh the index to make newly indexed documents searchable.

```bash
curl -k -u elastic -X POST https://localhost:9200/products/_refresh
```

---

## Step 5 – List All Indices

Display all available indices in the Elasticsearch cluster.

```bash
curl -k -u elastic https://localhost:9200/_cat/indices?v
```

---

## Step 6 – Retrieve All Documents

Retrieve every document stored in the **products** index.

```bash
curl -k -u elastic https://localhost:9200/products/_search?pretty
```

---

## Step 7 – Limit Search Results

Return only two documents from the search results.

```bash
curl -k -u elastic https://localhost:9200/products/_search?size=2&pretty
```

---

## Step 8 – Search Using Query Parameters

Search for a document where the **name** field contains **Laptop**.

```bash
curl -k -u elastic "https://localhost:9200/products/_search?q=name:Laptop&pretty"
```

---

# ✅ Verification

The lab was successfully completed after:

- Creating a new Elasticsearch index.
- Indexing sample JSON documents.
- Listing indices using the Cat API.
- Retrieving all indexed documents.
- Limiting search results with the **size** parameter.
- Searching documents using the **q** query parameter.

---

# 📚 Key Concepts Learned

- Elasticsearch Index Management
- Document Indexing
- Cat API
- Search API
- Query Parameters
- JSON Documents
- REST API Operations
- Data Retrieval

---

# 📸 Screenshots

## Products Index Listed Successfully

![Products Index](list-indices.png)

---

## Search Query Results

![Search Results](search-results.png)

---

# 🛠️ Commands Used

```bash
curl -k -u elastic https://localhost:9200

curl -k -u elastic -X PUT https://localhost:9200/products

curl -k -u elastic -X POST https://localhost:9200/products/_doc/1

curl -k -u elastic -X POST https://localhost:9200/products/_doc/2

curl -k -u elastic -X POST https://localhost:9200/products/_doc/3

curl -k -u elastic -X POST https://localhost:9200/products/_refresh

curl -k -u elastic https://localhost:9200/_cat/indices?v

curl -k -u elastic https://localhost:9200/products/_search?pretty

curl -k -u elastic https://localhost:9200/products/_search?size=2&pretty

curl -k -u elastic "https://localhost:9200/products/_search?q=name:Laptop&pretty"
```

---

# 🎯 Skills Gained

- Elasticsearch Querying
- Index Creation
- Document Indexing
- REST API Usage
- Data Retrieval
- Query Parameter Filtering
- JSON Data Management
- Kibana & Elasticsearch Fundamentals

---

# ✅ Conclusion

This lab introduced the core querying capabilities of Elasticsearch by creating a new index, indexing sample documents, and executing REST API queries to retrieve and filter data. The Cat API was used to inspect available indices, while the Search API enabled document retrieval and keyword-based searches. These foundational skills are essential for working with Elasticsearch in log management, SIEM, and data analytics environments.
