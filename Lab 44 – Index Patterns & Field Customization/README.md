# 📑 Lab 44: Index Patterns & Field Customization in Kibana

## 📌 Lab Summary

This lab demonstrates how to customize data presentation in Kibana by editing **Data Views (formerly Index Patterns)**. You will learn how to format existing fields, create scripted fields using the **Painless** scripting language, and verify these customizations in Discover and Visualize. These features improve data readability and provide additional calculated fields without modifying the original indexed data.

---

## 🎯 Objectives

- Understand Kibana Data Views (Index Patterns).
- Edit field formatting for better visualization.
- Create custom Scripted Fields using Painless.
- Verify customized fields in Discover.
- Use customized fields in visualizations.

---

## 🛠️ Lab Environment

| Component | Details |
|-----------|---------|
| Elasticsearch | 9.x |
| Kibana | 9.x |
| Operating System | Ubuntu 24.04 LTS |
| Browser | Google Chrome |

---

# 📖 Introduction

Data Views (previously called **Index Patterns**) tell Kibana how to access data stored in Elasticsearch. They also allow administrators to customize how fields are displayed without changing the actual indexed data.

Field formatting improves readability, while scripted fields generate new values dynamically using existing fields.

---

# 📂 Lab Tasks

## Task 1: Edit a Data View (Index Pattern)

Navigate to:

```
Stack Management
    └── Data Views
```

Select an existing Data View such as:

```
filebeat-*
```

or

```
logs-*
```

Open the field you want to customize.

---

## Task 2: Format a Numeric Field

Select a numeric field.

Example:

```
file.size
```

Under **Format**, choose:

```
Bytes
```

This automatically displays values as:

- KB
- MB
- GB

instead of raw byte values.

Save the changes.

---

## Task 3: Create a Scripted Field

Inside the Data View, select:

```
Add Scripted Field
```

Configure the field:

| Property | Value |
|----------|-------|
| Name | FullName |
| Language | Painless |
| Type | String |

---

## Task 4: Write a Painless Script

Example:

```painless
return doc['firstName.keyword'].value + ' ' + doc['lastName.keyword'].value;
```

This creates a new field named **FullName** by combining two existing fields.

Save the scripted field.

---

## Task 5: Verify Changes in Discover

Navigate to:

```
Analytics
    └── Discover
```

Select the modified Data View.

Verify:

- Formatted numeric fields
- Newly created scripted field
- Search results

Add the new field to the table if necessary.

---

## Task 6: Create a Visualization

Navigate to:

```
Analytics
    └── Visualize Library
```

Create a new visualization using the modified Data View.

Example visualizations:

- Data Table
- Bar Chart
- Pie Chart
- Lens Visualization

Include the formatted or scripted fields and save the visualization.

---

# 🔍 Key Concepts

## Data View (Index Pattern)

Defines how Kibana accesses Elasticsearch indices.

---

## Field Formatting

Displays field values in a more user-friendly format without changing stored data.

Examples include:

- Bytes
- Percentage
- Duration
- Date
- Currency

---

## Scripted Field

A virtual field calculated at query time using the Painless scripting language.

---

## Painless

The default scripting language used by Elasticsearch for creating runtime calculations.

---

## Discover

A Kibana application used for searching and exploring indexed documents.

---

# 💡 Use Cases

Field customization is useful for:

- Storage reporting
- User-friendly dashboards
- Log analysis
- Security investigations
- Custom calculations
- Data normalization
- Reporting and visualization

---

# 📊 Outcome

After completing this lab, the following skills were achieved:

- Edited a Kibana Data View.
- Customized field formatting.
- Created a Scripted Field.
- Used the Painless scripting language.
- Verified customized fields in Discover.
- Used customized fields in Kibana visualizations.

---

# ✅ Conclusion

This lab introduced Data View customization in Kibana through field formatting and scripted fields. These features allow analysts to improve data readability and create calculated values dynamically without modifying Elasticsearch documents, making dashboards and investigations more informative and efficient.

---

# 📚 Key Takeaways

- Data Views define how Kibana reads Elasticsearch data.
- Field formatting improves readability.
- Scripted fields generate calculated values dynamically.
- Painless is Elasticsearch's scripting language.
- Customized fields can be used throughout Kibana.

